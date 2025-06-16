// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RareToken is ERC20 {
    constructor() ERC20("RareToken", "RTK") {}

    function mint(uint256 value) external {
        _mint(msg.sender, value);
    }

    function mintTo(address to, uint256 value) external {
        _mint(to, value);
    }
}
