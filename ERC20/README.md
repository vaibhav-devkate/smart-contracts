# ERC20 Token Implementations

This directory contains two versions of an ERC20 token implementation for learning and comparison.

## Implementations

### 1. Raw Implementation (`MyTokenRaw.sol`)
A from-scratch implementation of the ERC20 standard. This is useful for understanding how the core logic of a token actually works, including:
- Manual balance management.
- Manual allowance and approval logic.
- Basic security checks.

### 2. OpenZeppelin Implementation (`MyTokenOZ.sol`)
An implementation based on the [OpenZeppelin ERC20](https://docs.openzeppelin.com/contracts/5.x/api/token/erc20) library. This is the industry standard for production use because it is:
- Extensively audited.
- Highly optimized.
- Modular and easy to extend.

## Key Differences

| Feature | Raw Implementation | OpenZeppelin Implementation |
| :--- | :--- | :--- |
| **Code Length** | ~80 lines | ~15 lines |
| **Reliability** | Educational only | Production ready |
| **Logic** | Manual | Inherited |

## Deployment

To deploy either contract:

1.  Initialize a project with [Hardhat](https://hardhat.org/) or [Foundry](https://book.getfoundry.sh/).
2.  Install OpenZeppelin contracts (for the OZ version):

    ```bash
    npm install @openzeppelin/contracts
    ```

3.  Compile using Solidity `0.8.20` or higher.
4.  Deploy providing the `initialSupply`.

## Key Functions (Both Versions)

- `balanceOf(address account)`: Returns token balance of `account`.
- `transfer(address to, uint256 amount)`: Transfers tokens to `to`.
- `approve(address spender, uint256 amount)`: Sets allowance for `spender`.
- `transferFrom(address from, address to, uint256 amount)`: Transfers tokens using allowance.

## License

MIT
