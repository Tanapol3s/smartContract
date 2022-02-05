// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.3.2 (token/ERC20/ERC20.sol)

pragma solidity ^0.8.0;

contract TestUnChecked {
    function f(uint a, uint b) pure public returns (uint) {
        // This addition will wrap on underflow.
        unchecked { return a - b; }
    }
    function g(uint a, uint b) pure public returns (uint) {
        // This addition will revert on underflow.
        return a - b;
    }
}