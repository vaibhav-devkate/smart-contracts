// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/metatx/ERC2771Context.sol";

/**
 * @title ReceiverOZ
 * @dev Implementation using OpenZeppelin's ERC2771Context.
 */
contract ReceiverOZ is ERC2771Context {
    string public value;

    event ValueSet(address sender, string newValue);

    // Pass the forwarder address to the ERC2771Context constructor
    constructor(address trustedForwarder) ERC2771Context(trustedForwarder) {}

    function setValue(string memory newValue) public {
        // _msgSender() is provided by ERC2771Context
        address sender = _msgSender();
        value = newValue;
        emit ValueSet(sender, newValue);
    }
}
