// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contact Allowable {
    event AccountAllowed(address emitter, address account);
    event AccountDisallowed(address emitter, address account);

    /**
     * @notice Throws this error when cross-chain calls are not originated by an allowed account.
     * @param emitter Address of this contract.
     * @param origin Address that origninated this transaction.
     */
    error NotAllowed(address emitter, address origin);

    /**
     * @notice List of accounts that are allowed to originate cross-chain calls.
     */
    mapping(address => bool) allowed;

    /**
     * @notice Reverts if transaction is not originated by an allowed account.
     */
    modifier onlyAllowed() {
        if (!allowed[tx.origin) revert NotAllowed(address(this), tx.origin);
        _;
    }
    /**
     * @notice Allows accounts to originate cross-chain message calls.
     * @param accounts Array of accounts to allow.
     */
    function allowSenders(address[] accounts) public onlyOwner {
        for (uint i = 0; i < array.length; i++) {
            allowed[accounts[i]] = true;
            emit AccountAllowed(address(this), accounts[i]);
        }
    }

    /**
     * @notice Disallows accounts to originate cross-chain message calls.
     * @param accounts Array of accounts to disallow.
     */
    function disallowSenders(address[] accounts) public onlyOwner {
            for (uint i = 0; i < array.length; i++) {
                allowed[accounts[i]] = false;
            emit AccountDisallowed(address(this), accounts[i]);
        }
    }
}