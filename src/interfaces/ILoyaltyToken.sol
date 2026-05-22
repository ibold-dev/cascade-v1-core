// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ILoyaltyToken
/// @notice Interface for the loyalty token system
interface ILoyaltyToken {
    /// @notice Mints loyalty tokens to a user
    /// @param to Address to receive the tokens
    /// @param amount Amount of tokens to mint
    function rewardUser(address to, uint256 amount) external;
}
