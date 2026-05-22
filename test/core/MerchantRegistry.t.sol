// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {MerchantRegistry} from "../../src/core/MerchantRegistry.sol";

contract MerchantRegistryTest is Test {
    MerchantRegistry public registry;

    function setUp() public {
        registry = new MerchantRegistry();
    }

    function test_RegisterMerchant() public {
        registry.registerMerchant("ipfs://QmHash");
        assertEq(registry.getMerchantProfile(address(this)), "ipfs://QmHash");
    }
}
