// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IConditionalEscrow} from "../interfaces/IConditionalEscrow.sol";
import {Errors} from "../libraries/Errors.sol";
import {Structs} from "../libraries/Structs.sol";

contract ConditionalEscrow is IConditionalEscrow {
    uint256 private _nextEscrowId;
    mapping(uint256 => Structs.EscrowDetails) public escrows;

    function deposit(address payee, address attester, uint256 deadline) external payable returns (uint256 escrowId) {
        if (msg.value == 0) revert Errors.InvalidAmount();
        escrowId = _nextEscrowId++;
        escrows[escrowId] = Structs.EscrowDetails({
            payer: msg.sender,
            payee: payee,
            attester: attester,
            amount: msg.value,
            deadline: deadline,
            state: Structs.EscrowState.Pending
        });
        emit Deposited(msg.sender, payee, escrowId, msg.value);
    }

    function release(uint256 escrowId) external {
        Structs.EscrowDetails storage escrow = escrows[escrowId];
        if (msg.sender != escrow.attester) revert Errors.Unauthorized();
        if (escrow.state != Structs.EscrowState.Pending) revert Errors.EscrowNotActive();

        escrow.state = Structs.EscrowState.Released;
        uint256 amount = escrow.amount;

        (bool success,) = escrow.payee.call{value: amount}("");
        if (!success) revert Errors.TransferFailed();
        
        emit Released(escrowId, escrow.payee, amount);
    }

    function refund(uint256 escrowId) external {
        Structs.EscrowDetails storage escrow = escrows[escrowId];
        if (escrow.state != Structs.EscrowState.Pending) revert Errors.EscrowNotActive();
        if (block.timestamp <= escrow.deadline) revert Errors.EscrowNotExpired();

        escrow.state = Structs.EscrowState.Refunded;
        uint256 amount = escrow.amount;

        (bool success,) = escrow.payer.call{value: amount}("");
        if (!success) revert Errors.TransferFailed();
        
        emit Refunded(escrowId, escrow.payer, amount);
    }
}
