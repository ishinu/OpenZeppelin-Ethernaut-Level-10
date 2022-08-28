# OpenZeppelin Ethernaut Level 10

After trying many different strategies on Remix-IDE and getting `VM instance revert`, i thought let's just deploy on Rinkeby and Attack instance directly. ( instead of failed testing in Remix)

And...It worked!

It's same reentrancy, just not working in Remix-IDE. 

## Steps to make it work

- Deploy Attack contract on Rinkeby by passing address of `Reentrance.sol instance` received from Ethernaut and `0.001 ether`
- Call `attack()` to deposit `0.001 ether`.
- Call `fallback()` simply and in metamask popup, manually `edit` and increaase the gas, just add an extra 0 at the end to help it make multiple external calls.
- That's all and it will drain all the funds from the `Reentrance.sol`.