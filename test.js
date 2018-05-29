const web3 = require("web3");
const sha3 = require("solidity-sha3").default;
const sha256 = require("js-sha256");
const Web3Utils = require('web3-utils');

const assert = require("assert");

const expected = "0x6609cec3088867a76357af36f33cb05f01c036b4a36c3c9725a90c0c0d43337a";
const expectedSimple = "0x4a2cc91ee622da3bc833a54c37ffcb6f3ec23b7793efc5eaf5e71b7b406c5c06";
const expectedSimplest = "0x699b4022d8f3c7cc0b3a63b63fbdf4c34118348e4dfe1c6300fccd25d5465bc3";

const orderID = 45;
const buyer = "0x900Cb1742bA5f41A6D16690E77a17b862cDf507F";
const seller = "0x313Ae047aC8c167fFa286BA10EF0ec9a86647444";

const result = Web3Utils.soliditySha3(orderID, buyer, seller);
const resultSimple = sha3(orderID);
const resultSimplest = sha3(buyer);

assert.equal(resultSimplest, expectedSimplest);

assert.equal(resultSimple, expectedSimple);

assert.equal(result, expected);