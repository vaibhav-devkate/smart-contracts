# Contributing Guidelines

Welcome to the Smart Contracts repository! We follow a specific "Dual Implementation" pattern for all smart contracts added here to maximize educational value and production readiness.

## The Standard Pattern

Every new smart contract standard added to this repository MUST include:

1.  **Raw Implementation (`*Raw.sol`)**:
    -   Implement the logic from scratch.
    -   Avoid external libraries for core functionality.
    -   Focus on readability and educational clarity.

2.  **OpenZeppelin Implementation (`*OZ.sol`)**:
    -   Inherit from [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/).
    -   Follow industry best practices for security and gas optimization.
    -   Ready for production deployment.

3.  **Documentation (`README.md`)**:
    -   Explain the contract standard.
    -   Provide a comparison between the Raw and OZ versions.
    -   List key functions and events.

## How to Contribute

1.  Fork the repository.
2.  Create a new directory for your contract (e.g., `ERC1155/`).
3.  Add both the `Raw` and `OZ` Solidity files.
4.  Add the `README.md`.
5.  Submit a Pull Request.


