// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract W3BToken is ERC20 {

    constructor() ERC20("W3BToken", "W3B") {
        _mint(_msgSender(), 10000e18);
    }
}