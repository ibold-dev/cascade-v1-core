// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {CascadeOrchestrator} from "../src/core/CascadeOrchestrator.sol";
import {ConditionalEscrow} from "../src/core/ConditionalEscrow.sol";
import {LoyaltyToken} from "../src/core/LoyaltyToken.sol";
import {ActivityLogger} from "../src/core/ActivityLogger.sol";
import {MerchantRegistry} from "../src/core/MerchantRegistry.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        console.log("Deploying contracts with address:", deployerAddress);

        vm.startBroadcast(deployerPrivateKey);

        // 1. Deploy ActivityLogger
        ActivityLogger logger = new ActivityLogger();
        console.log("ActivityLogger deployed to:", address(logger));

        // 2. Deploy MerchantRegistry
        MerchantRegistry registry = new MerchantRegistry();
        console.log("MerchantRegistry deployed to:", address(registry));

        // 3. Deploy CascadeOrchestrator
        CascadeOrchestrator orchestrator = new CascadeOrchestrator();
        console.log("CascadeOrchestrator deployed to:", address(orchestrator));

        // 4. Deploy ConditionalEscrow
        ConditionalEscrow escrow = new ConditionalEscrow();
        console.log("ConditionalEscrow deployed to:", address(escrow));

        // 5. Deploy LoyaltyToken
        LoyaltyToken token = new LoyaltyToken(deployerAddress);
        console.log("LoyaltyToken deployed to:", address(token));

        vm.stopBroadcast();
    }
}
