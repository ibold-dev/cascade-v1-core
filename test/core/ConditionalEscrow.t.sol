// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {ConditionalEscrow} from "../../src/core/ConditionalEscrow.sol";

contract ConditionalEscrowTest is Test {
    ConditionalEscrow public escrow;
    address payee = address(0x1);
    address attester = address(0x2);

    function setUp() public {
        escrow = new ConditionalEscrow();
    }

    function test_Deposit() public {
        vm.deal(address(this), 1 ether);
        uint256 deadline = block.timestamp + 1 days;
        uint256 id = escrow.deposit{value: 1 ether}(payee, attester, deadline);
        assertEq(id, 0);
    }
}
