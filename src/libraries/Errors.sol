// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Errors
/// @notice Centralized custom errors for the Cascade Agent system.
library Errors {
    error Unauthorized();
    error ZeroAddress();
    error InvalidAmount();
    error EscrowNotActive();
    error EscrowExpired();
    error EscrowNotExpired();
    error TransferFailed();
    error CallFailed();
}
