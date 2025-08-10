// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewPureExamples {

    uint256 private storedNumber;

    constructor(uint256 _initial){
        storedNumber = _initial;
    } 

    function setNumber(uint256 _n) public {
        storedNumber = _n;
    }

    function getNumber() public view returns (uint256) {
        return storedNumber;
    }

    function doubleStored() public view returns (uint256) {
        return storedNumber *2;
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "division by zero");
        return a / b;
    }

    function concatAndHash(string memory a, string memory b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }

    function getBlockTimesstanp() public view returns (uint256) {
        return block.timestamp;
    }
}