// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Structs
/// @notice Centralized structs for the Cascade Agent system.
library Structs {
    enum EscrowState {
        Pending,
        Released,
        Refunded
    }

    struct EscrowDetails {
        address payer;
        address payee;
        address attester;
        address tokenAddress;
        uint256 amount;
        uint256 deadline;
        EscrowState state;
    }
}
