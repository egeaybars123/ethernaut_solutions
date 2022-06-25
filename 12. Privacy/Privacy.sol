// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy {

  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}

/* 
Solution:

Each storage slot in Solidity smart contracts can take up to 32 bytes.
If the variables coming after a variable could fit into a 32 byte slot,
then they can take a single slot. Order of the slots for each variable is
given below:
boolean: slot 0,
ID: slot 1,
flattening, denomination, awkwardness: slot 2,
bytes32[3] private data: slot 3, slot 4 and slot 5
(where index 2 in the fixed-size array is at slot 5). 
***For the require statements, we need the index 2.
Then, bytes32 is parsed to bytes16 by taking the first 16 characters where
the contract becomes unlocked.

*/