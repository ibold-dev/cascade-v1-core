// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {ActivityLogger} from "../../src/core/ActivityLogger.sol";

contract ActivityLoggerTest is Test {
    ActivityLogger public logger;

    function setUp() public {
        logger = new ActivityLogger();
    }

    function test_LogAction() public {
        logger.logAction(address(this), "TEST_ACTION", "test_data");
    }
}
