// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IMerchantRegistry} from "../interfaces/IMerchantRegistry.sol";

contract MerchantRegistry is IMerchantRegistry {
    mapping(address => string) private _profiles;

    function registerMerchant(string calldata profileURI) external {
        _profiles[msg.sender] = profileURI;
        emit MerchantRegistered(msg.sender, profileURI);
    }

    function deregisterMerchant() external {
        delete _profiles[msg.sender];
        emit MerchantDeregistered(msg.sender);
    }

    function getMerchantProfile(address merchant) external view returns (string memory) {
        return _profiles[merchant];
    }
}
