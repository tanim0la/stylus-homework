// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RareToken is ERC20 {
    address owner;

    constructor() ERC20("RareToken", "RTK") {}

    function init() external {
        require(owner == address(0), "Owner Already Initialized");

        owner = msg.sender;
    }

    function mint() external {
        require(msg.sender == owner, "Caller Not Owner");

        _mint(msg.sender, 15);
    }
}
