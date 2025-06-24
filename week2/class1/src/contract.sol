// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address owner) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
}

contract PushBasedDistributor {
    address[2] public recipients =
        [0x5E1497dD1f08C87b2d8FE23e9AAB6c1De833D927, 0x3f1Eae7D46d88F08fc2F8ed27FCb2AB183EB2d0E];

    error TransferFailed();
    error InsufficientBalance();

    function getAmountToDistribute(address _token) public view returns (uint256) {
        // Get the contract's token balance
        uint256 balance = IERC20(_token).balanceOf(address(this));
        uint256 recipientCount = recipients.length;

        if (balance <= 0) revert InsufficientBalance();

        return balance / recipientCount;
    }

    function distribute(IERC20 _token) external {
        uint256 amount = getAmountToDistribute(address(_token));

        for (uint256 i = 0; i < recipients.length; i++) {
            if (!_token.transfer(recipients[i], amount)) revert TransferFailed();
        }
    }
}
