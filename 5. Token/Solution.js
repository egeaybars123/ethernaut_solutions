/*
Using Remix IDE, I called the transfer function.
My address had a balance of 20, and I tried to transfer 21 tokens 
to another function. This caused integer underflow where my balance 
occurred to be the maximum amount an uint256 could take. Calculations
in 0.6 with uint Solidity could be tricky because uint does not support negative
values, and integer overlow or underflow could occur. Using OpenZeppelin's 
SafeMath library could be useful because it checks for underflows and overflows;
if either occurs, transaction is reverted.

*/