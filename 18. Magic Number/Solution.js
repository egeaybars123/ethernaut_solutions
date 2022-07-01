const bytecode = "0x600a600c600039600a6000f3602a60805260206080f3";
/* 
Till the first f3 (return), the bytecode contains initialization opcodes.
It means that it takes the runtime opcodes (between first and second f3), and
returns it to the EVM for the code to execute.
60 means push1 opcode, 0a is 10 bytes, and 2a is the magic number 42 in decimals.
f3 means return.
52 means mstore where the value is stored as a memory variable 
temporarily for the value to be returned.
*/

const contract_address = await web3.eth.sendTransaction({from: player, data: bytecode});
await contract.setSolver(contract_address.contractAddress);
