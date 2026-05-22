// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMerchantRegistry
/// @notice Interface for onchain merchant registry
interface IMerchantRegistry {
    /// @notice Emitted when a merchant registers or updates their profile
    event MerchantRegistered(address indexed merchant, string profileURI);

    /// @notice Emitted when a merchant is deregistered
    event MerchantDeregistered(address indexed merchant);

    /// @notice Registers or updates a merchant profile
    /// @param profileURI URI containing offchain metadata about the merchant
    function registerMerchant(string calldata profileURI) external;

    /// @notice Deregisters a merchant profile
    function deregisterMerchant() external;

    /// @notice Retrieves a merchant's profile URI
    /// @param merchant Address of the merchant
    /// @return profileURI The registered URI, or empty string if not registered
    function getMerchantProfile(address merchant) external view returns (string memory profileURI);
}
