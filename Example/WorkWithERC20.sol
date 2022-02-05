// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TestERC20 {

    IERC20 coin;

    constructor(IERC20 _coin) {
        coin = _coin;
    }

    function getCoin() public view returns(uint) {
        return coin.balanceOf(address(this));
    }

    function transfer() public {
        coin.transferFrom(msg.sender, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 10000);
    }
}