// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {ConditionalEscrow} from "../../src/core/ConditionalEscrow.sol";
import {MockERC20} from "../mocks/MockERC20.sol";

contract ConditionalEscrowTest is Test {
    ConditionalEscrow public escrow;
    MockERC20 public token;

    address payee = address(0x1);
    address attester = address(0x2);

    function setUp() public {
        escrow = new ConditionalEscrow();
        token = new MockERC20("Mock Token", "MTK");
    }

    function test_DepositNative() public {
        vm.deal(address(this), 1 ether);
        uint256 deadline = block.timestamp + 1 days;
        uint256 id = escrow.deposit{value: 1 ether}(payee, attester, address(0), 0, deadline);
        assertEq(id, 0);
    }

    function test_DepositERC20() public {
        token.mint(address(this), 1000);
        token.approve(address(escrow), 1000);
        uint256 deadline = block.timestamp + 1 days;
        uint256 id = escrow.deposit(payee, attester, address(token), 1000, deadline);
        assertEq(id, 0);
        assertEq(token.balanceOf(address(escrow)), 1000);
    }
}
