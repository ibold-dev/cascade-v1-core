// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IConditionalEscrow
/// @notice Interface for conditional escrow handling
interface IConditionalEscrow {
    /// @notice Emitted when funds are deposited into escrow
    event Deposited(
        address indexed payer, address indexed payee, uint256 escrowId, address tokenAddress, uint256 amount
    );

    /// @notice Emitted when funds are released from escrow
    event Released(uint256 escrowId, address indexed payee, address tokenAddress, uint256 amount);

    /// @notice Emitted when funds are refunded from escrow
    event Refunded(uint256 escrowId, address indexed payer, address tokenAddress, uint256 amount);

    /// @notice Deposits funds into escrow
    /// @param payee The intended recipient of the funds
    /// @param attester The address allowed to attest and release funds
    /// @param tokenAddress The address of the ERC20 token, or address(0) for native token
    /// @param amount The amount of tokens to deposit (for ERC20 only; native token amount is derived from msg.value)
    /// @param deadline Timestamp after which funds can be refunded if not released
    /// @return escrowId The unique identifier of the escrow
    function deposit(address payee, address attester, address tokenAddress, uint256 amount, uint256 deadline)
        external
        payable
        returns (uint256 escrowId);

    /// @notice Releases funds to the payee (callable only by attester)
    /// @param escrowId The unique identifier of the escrow
    function release(uint256 escrowId) external;

    /// @notice Refunds funds to the payer (callable only after deadline)
    /// @param escrowId The unique identifier of the escrow
    function refund(uint256 escrowId) external;
}
