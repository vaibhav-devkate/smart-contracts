# ERC-721 Implementation

This directory contains two implementations of the ERC-721 Non-Fungible Token Standard, following the "One Raw, One Lib, One Doc" pattern.

## Overview

ERC-721 is a free, open standard that describes how to build non-fungible or unique tokens on the Ethereum blockchain. Unlike ERC-20 tokens, which are identical and interchangeable, ERC-721 tokens are unique.

## Implementations

### 1. Raw Implementation ([MyNFTRaw.sol](./MyNFTRaw.sol))
A from-scratch implementation of the ERC-721 standard. It demonstrates the core logic of ownership, balances, and transfers without relying on external libraries.

- **Focus**: Educational, transparency of logic.
- **Key Features**: Manual mapping of owners and balances, implementation of `safeTransferFrom` with receiver checks.

### 2. OpenZeppelin Implementation ([MyNFTOZ.sol](./MyNFTOZ.sol))
A production-ready implementation that leverages the industry-standard OpenZeppelin library.

- **Focus**: Security, community-vetted, feature-rich.
- **Key Features**: Inherits from `ERC721` and `ERC721URIStorage`, includes `Ownable` for access control, uses `Counters` (or auto-increment logic) for token IDs.

## Comparison

| Feature | Raw Implementation | OpenZeppelin Implementation |
| :--- | :--- | :--- |
| **Complexity** | High (manual logic) | Low (inherited logic) |
| **Security** | Not audited, for education | Industry standard, highly secure |
| **Use-case** | Learning and debugging | Production deployment |
| **Gas Efficiency** | Can be optimized for specific needs | Standard optimization |

## Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/)
- [Hardhat](https://hardhat.org/) or [Foundry](https://book.getfoundry.sh/)

### Installation
```bash
npm install @openzeppelin/contracts
```

### Deployment (Example with Hardhat)
```javascript
const MyNFTOZ = await ethers.getContractFactory("MyNFTOZ");
const nft = await MyNFTOZ.deploy(ownerAddress);
await nft.deployed();
console.log("NFT deployed to:", nft.address);
```

### Minting
**Raw Version:**
```solidity
myNFTRaw.mint(recipient, tokenId);
```

**OZ Version:**
```solidity
myNFTOZ.safeMint(recipient, "https://api.example.com/metadata/1");
```
