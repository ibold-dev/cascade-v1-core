// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {CascadeOrchestrator} from "../../src/core/CascadeOrchestrator.sol";
import {ICascadeOrchestrator} from "../../src/interfaces/ICascadeOrchestrator.sol";

contract CascadeOrchestratorTest is Test {
    CascadeOrchestrator public orchestrator;

    function setUp() public {
        orchestrator = new CascadeOrchestrator();
    }

    function test_Receive() public {
        vm.deal(address(this), 1 ether);
        (bool success,) = address(orchestrator).call{value: 1 ether}("");
        assertTrue(success);
        assertEq(address(orchestrator).balance, 1 ether);
    }
}
