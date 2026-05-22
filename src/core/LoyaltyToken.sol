// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ILoyaltyToken} from "../interfaces/ILoyaltyToken.sol";
import {CascadeAccess} from "../base/CascadeAccess.sol";

contract LoyaltyToken is ERC20, ILoyaltyToken, CascadeAccess {
    constructor(address initialOwner) ERC20("Cascade Loyalty", "CLT") CascadeAccess(initialOwner) {}

    function rewardUser(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
