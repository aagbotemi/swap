// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LinkToken is ERC20 {
    constructor() ERC20("LinkToken", "LNK") {
        _mint(_msgSender(), 10000e18);
    }
}