// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ReceiverRaw
 * @dev A contract that manually implements ERC-2771 for meta-transactions.
 */
contract ReceiverRaw {
    address private _trustedForwarder;
    string public value;

    event ValueSet(address sender, string newValue);

    constructor(address trustedForwarder) {
        _trustedForwarder = trustedForwarder;
    }

    function isTrustedForwarder(address forwarder) public view returns (bool) {
        return forwarder == _trustedForwarder;
    }

    function setValue(string memory newValue) public {
        address sender = _msgSender();
        value = newValue;
        emit ValueSet(sender, newValue);
    }

    /**
     * @dev Implementation of the ERC-2771 _msgSender()
     * Extracts the original sender from the end of the calldata if called by forwarder.
     */
    function _msgSender() internal view returns (address sender) {
        if (isTrustedForwarder(msg.sender)) {
            // The assembly code is used to extract the last 20 bytes of the calldata
            assembly {
                sender := shr(96, calldataload(sub(calldatasize(), 20)))
            }
        } else {
            return msg.sender;
        }
    }

    function _msgData() internal view returns (bytes calldata) {
        if (isTrustedForwarder(msg.sender)) {
            return msg.data[:msg.data.length - 20];
        } else {
            return msg.data;
        }
    }
}
