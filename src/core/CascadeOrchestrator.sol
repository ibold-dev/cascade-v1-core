// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ICascadeOrchestrator} from "../interfaces/ICascadeOrchestrator.sol";
import {Errors} from "../libraries/Errors.sol";

contract CascadeOrchestrator is ICascadeOrchestrator {
    receive() external payable {}

    function executeBundle(Call[] calldata calls) external payable {
        for (uint256 i = 0; i < calls.length; i++) {
            (bool success,) = calls[i].target.call{value: calls[i].value}(calls[i].callData);
            if (!success) {
                revert Errors.CallFailed();
            }
        }
        emit BundleExecuted(msg.sender, calls.length);
    }
}
