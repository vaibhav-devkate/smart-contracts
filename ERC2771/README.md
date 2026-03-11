# ERC-2771 Meta-Transactions

This directory contains two versions of an ERC-2771 compliant recipient contract for meta-transactions.

## Overview

ERC-2771 defines a standard for "gasless" transactions, where a user can sign a message off-chain, and a third-party (Relayer/Forwarder) pays the gas fee to execute it.

The recipient contract must be able to identify the **original sender** (the user who signed the message) instead of the **immediate sender** (the forwarder).

## Implementations

### 1. Raw Implementation (`ReceiverRaw.sol`)
Shows the underlying mechanism of ERC-2771:
- Checks if `msg.sender` is a trusted forwarder.
- If it is, it extracts the original user address from the last 20 bytes of `msg.data`.
- This extraction is done using inline assembly for efficiency.

### 2. OpenZeppelin Implementation (`ReceiverOZ.sol`)
Leverages OpenZeppelin's `ERC2771Context`:
- Simplifies the contract logic by inheriting standard functions.
- Provides a clean `_msgSender()` internal function that handles the extraction automatically.

## How it Works

1.  **User** signs a transaction payload.
2.  **Relayer** sends the payload + User's signature to a **Forwarder** contract.
3.  **Forwarder** verifies the signature and calls the **Receiver** contract.
4.  **Forwarder** appends the **User's address** (20 bytes) to the end of the `calldata`.
5.  **Receiver** uses `_msgSender()` to extract that user address.

## Comparison

| Aspect | Raw Implementation | OpenZeppelin Implementation |
| :--- | :--- | :--- |
| **Complexity** | Manual assembly bit-shifting | Single inheritance |
| **Safety** | High risk of errors in assembly | Audited and standard |
| **Maintenance** | Manual updates required | Easy library updates |

## Usage

1.  Deploy a Forwarder contract (e.g., OpenZeppelin's `MinimalForwarder`).
2.  Deploy either `ReceiverRaw` or `ReceiverOZ` providing the Forwarder's address.
3.  Users call `setValue` via the Forwarder to enjoy gasless transactions.

## License

MIT
