// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IActivityLogger} from "../interfaces/IActivityLogger.sol";

contract ActivityLogger is IActivityLogger {
    function logAction(address user, string calldata actionType, string calldata data) external {
        emit ActionLogged(user, actionType, data);
    }
}
