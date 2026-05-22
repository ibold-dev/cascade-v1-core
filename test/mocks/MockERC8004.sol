// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockERC8004 {
    // Mock for ERC-8004 implementation (just a placeholder for agent reputation)
    mapping(address => uint256) public reputation;

    function increaseReputation(address agent, uint256 amount) external {
        reputation[agent] += amount;
    }
}
