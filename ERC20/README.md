# MyToken (ERC20)

A standard implementation of an ERC20 token on the Ethereum blockchain.

## Overview

This contract is based on the [OpenZeppelin ERC20](https://docs.openzeppelin.com/contracts/5.x/api/token/erc20) implementation, which is the industry standard for secure and reliable token contracts.

It provides the core functionality required for an ERC20 token, including:

- Transferring tokens from one account to another.
- Getting the current token balance of an account.
- Authorizing others (like decentralized exchanges) to spend tokens on your behalf.
- Total supply management.

## Contract Details

- **Name:** MyToken
- **Symbol:** MTK
- **Decimals:** 18
- **Initial Supply:** Defined at deployment (multiplied by 10^18).

## Key Functions

### `balanceOf(address account)`

Returns the number of tokens owned by `account`.

### `transfer(address to, uint256 amount)`

Moves `amount` tokens from the caller's account to `to`. Returns a boolean value indicating whether the operation succeeded.

### `approve(address spender, uint256 amount)`

Sets `amount` as the allowance of `spender` over the caller's tokens.

### `transferFrom(address from, address to, uint256 amount)`

Moves `amount` tokens from `from` to `to` using the allowance mechanism. `amount` is then deducted from the caller's allowance.

## Deployment

To deploy this contract:

1.  Initialize a project with [Hardhat](https://hardhat.org/) or [Foundry](https://book.getfoundry.sh/).
2.  Install OpenZeppelin contracts:

    ```bash
    npm install @openzeppelin/contracts
    ```

3.  Compile using Solidity `0.8.20` or higher.
4.  Deploy providing the `initialSupply`.

## Events

- `Transfer(address indexed from, address indexed to, uint256 value)`: Triggered when tokens are transferred.
- `Approval(address indexed owner, address indexed spender, uint256 value)`: Triggered when an allowance is set.

## License

This project is licensed under the MIT License.
