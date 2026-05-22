// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IActivityLogger
/// @notice Interface for logging activity and reputation onchain
interface IActivityLogger {
    /// @notice Emitted when an action is logged
    event ActionLogged(address indexed user, string actionType, string data);

    /// @notice Logs a user action or feedback
    /// @param user Address of the user
    /// @param actionType Type of action performed
    /// @param data Offchain reference or metadata (e.g., CID or JSON string)
    function logAction(address user, string calldata actionType, string calldata data) external;
}
