const data = web3.eth.abi.encodeFunctionSignature("pwn()");
contract.sendTransaction({data: data});

/*
In this contract, it is making a delegate call to another contract. 
In a delegate call, it is important to be aware of what happens on the execution layer.
When a delegate call is made, state changes in storage variable occurs in the contract 
where a delegate call is made, not in the delegate contract. If a delegate contract has a 
function that changes a state in its contract, this state change occurs in the delegation contract.
Therefore, if that function is encoded and passed as msg.data to a delegate call, the function
will be called, and state changes will occur, where ownership of the delegation contract is captured.
*/