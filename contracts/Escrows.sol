pragma solidity ^0.4.23;

contract Escrows {
    address public owner;
    address public arbitrator;

    struct Escrow {
        bool exists;
        uint256 _orderID;
        address _buyer;
        address _seller;
        uint256 _value;
    }

    mapping (bytes32 => Escrow) public escrows;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier onlyArbitrator() {
        require(arbitrator == msg.sender);
        _;
    }

    function Escrows() {
        owner = msg.sender;
        arbitrator = msg.sender;
    }

    function createEscrow(
        uint256 _orderID,
        address _buyer,
        address _seller,
        uint256 _value
    ) external payable {
        require(msg.value == _value);

        bytes32 hash = keccak256(uint256(_orderID), _buyer, _seller);

        require(escrows[hash].exists == false);

        Escrow memory escrow = Escrow(true, _orderID, _buyer, _seller, _value);

        escrows[hash] = escrow;
    }

    function transferMoney(
        uint256 _orderID,
        address _buyer,
        address _seller
    ) external {
        bytes32 hash = keccak256(uint256(_orderID), _buyer, _seller);

        Escrow memory escrow = escrows[hash];

        require(escrow.exists == true);
        require(escrow._buyer == msg.sender);

        escrow._seller.transfer(escrow._value);
    }
}