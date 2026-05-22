// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {LoyaltyToken} from "../../src/core/LoyaltyToken.sol";

contract LoyaltyTokenTest is Test {
    LoyaltyToken public token;

    function setUp() public {
        token = new LoyaltyToken(address(this));
    }

    function test_RewardUser() public {
        token.rewardUser(address(0x1), 100);
        assertEq(token.balanceOf(address(0x1)), 100);
    }
}
