// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title CascadeAccess
/// @notice Base contract for basic access control
abstract contract CascadeAccess is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}
}
