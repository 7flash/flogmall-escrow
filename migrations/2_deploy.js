const Escrows = artifacts.require("./Escrows");

module.exports = function(deployer, network, accounts) {
	deployer.deploy(Escrows);
}