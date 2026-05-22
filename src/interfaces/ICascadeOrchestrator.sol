// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICascadeOrchestrator
/// @notice Interface for the main entry point of the Cascade Agent system.
interface ICascadeOrchestrator {
    /// @notice Struct for a single call in a bundled transaction
    struct Call {
        address target;
        bytes callData;
        uint256 value;
    }

    /// @notice Emitted when a bundle of transactions is successfully executed
    event BundleExecuted(address indexed user, uint256 callCount);

    /// @notice Executes a bundle of transactions on behalf of a user
    /// @param calls Array of Calls to execute
    function executeBundle(Call[] calldata calls) external payable;
}
