// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
    
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

/*
In this contract, transfer can be exploited. Transfer sends ether to an EOA or 
a contract address with a fallback/receive function. However, the fallback function could be 
manipulated. If fallback function contains a revert function, then the owner will not 
be able proclaim itself as the King again because whole transaction reverts.
*/