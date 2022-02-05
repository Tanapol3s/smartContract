/**
 *Submitted for verification at polygonscan.com on 2021-06-29
*/

// SPDX-License-Identifier: MIT

// ((/*,                                                                    ,*((/,.
// &&@@&&%#/*.                                                        .*(#&&@@@@%. 
// &&@@@@@@@&%(.                                                    ,#%&@@@@@@@@%. 
// &&@@@@@@@@@&&(,                                                ,#&@@@@@@@@@@@%. 
// &&@@@@@@@@@@@&&/.                                            .(&&@@@@@@@@@@@@%. 
// %&@@@@@@@@@@@@@&(,                                          *#&@@@@@@@@@@@@@@%. 
// #&@@@@@@@@@@@@@@&#*                                       .*#@@@@@@@@@@@@@@@&#. 
// #&@@@@@@@@@@@@@@@@#.                                      ,%&@@@@@@@@@@@@@@@&#. 
// #&@@@@@@@@@@@@@@@@%(,                                    ,(&@@@@@@@@@@@@@@@@&#. 
// #&@@@@@@@@@@@@@@@@&&/                                   .(%&@@@@@@@@@@@@@@@@&#. 
// #%@@@@@@@@@@@@@@@@@@(.               ,(/,.              .#&@@@@@@@@@@@@@@@@@&#. 
// (%@@@@@@@@@@@@@@@@@@#*.            ./%&&&/.            .*%@@@@@@@@@@@@@@@@@@%(. 
// (%@@@@@@@@@@@@@@@@@@#*.           *#&@@@@&%*.          .*%@@@@@@@@@@@@@@@@@@%(. 
// (%@@@@@@@@@@@@@@@@@@#/.         ./#@@@@@@@@%(.         ./%@@@@@@@@@@@@@@@@@@%(. 
// (%@@@@@@@@@@@@@@@@@@#/.        ./&@@@@@@@@@@&(*        ,/%@@@@@@@@@@@@@@@@@@%(. 
// (%@@@@@@@@@@@@@@@@@@%/.       ,#&@@@@@@@@@@@@&#,.      ,/%@@@@@@@@@@@@@@@@@@%(. 
// /%@@@@@@@@@@@@@@@@@@#/.      *(&@@@@@@@@@@@@@@&&*      ./%@@@@@@@@@@@@@@@@@&%(. 
// /%@@@@@@@@@@@@@@@@@@#/.     .(&@@@@@@@@@@@@@@@@@#*.    ,/%@@@@@@@@@@@@@@@@@&#/. 
// ,#@@@@@@@@@@@@@@@@@@#/.    ./%@@@@@@@@@@@@@@@@@@&#,    ,/%@@@@@@@@@@@@@@@@@&(,  
//  /%&@@@@@@@@@@@@@@@@#/.    *#&@@@@@@@@@@@@@@@@@@@&*    ,/%@@@@@@@@@@@@@@@@&%*   
//  .*#&@@@@@@@@@@@@@@@#/.    /&&@@@@@@@@@@@@@@@@@@@&/.   ,/%@@@@@@@@@@@@@@@@#*.   
//    ,(&@@@@@@@@@@@@@@#/.    /@@@@@@@@@@@@@@@@@@@@@&(,   ,/%@@@@@@@@@@@@@@%(,     
//     .*(&&@@@@@@@@@@@#/.    /&&@@@@@@@@@@@@@@@@@@@&/,   ,/%@@@@@@@@@@@&%/,       
//        ./%&@@@@@@@@@#/.    *#&@@@@@@@@@@@@@@@@@@@%*    ,/%@@@@@@@@@&%*          
//           ,/#%&&@@@@#/.     ,#&@@@@@@@@@@@@@@@@@#/.    ,/%@@@@&&%(/,            
//               ./#&@@%/.      ,/&@@@@@@@@@@@@@@%(,      ,/%@@%#*.                
//                   .,,,         ,/%&@@@@@@@@&%(*        .,,,.                    
//                                   ,/%&@@@%(*.                                   
//  .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**((/*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
//                                                                                                                                                                                                                                                                                                            
//                                                                                             

pragma solidity 0.6.12;

pragma solidity ^0.6.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor () internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

pragma solidity 0.6.12;

pragma solidity 0.6.12;

pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

pragma solidity ^0.6.0;

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

pragma solidity 0.6.12;

pragma solidity ^0.6.0;

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

pragma solidity 0.6.12;

/**
 * @title Warden Trading Route
 * @dev The Warden trading route interface has an standard functions and event
 * for other smart contract to implement to join Warden Swap as Market Maker.
 */
interface IWardenTradingRoute {
    /**
    * @dev when new trade occure (and success), this event will be boardcast.
    * @param _src Source token
    * @param _srcAmount amount of source tokens
    * @param _dest   Destination token
    * @param _destAmount: amount of actual destination tokens
    */
    event Trade(
        IERC20 indexed _src,
        uint256 _srcAmount,
        IERC20 indexed _dest,
        uint256 _destAmount
    );

    /**
    * @notice use token address 0xeee...eee for ether
    * @dev makes a trade between src and dest token
    * @param _src Source token
    * @param _dest   Destination token
    * @param _srcAmount amount of source tokens
    ** @return _destAmount: amount of actual destination tokens
    */
    function trade(
        IERC20 _src,
        IERC20 _dest,
        uint256 _srcAmount,
        address receiver
    )
        external
        payable
        returns(uint256 _destAmount);

    /**
    * @dev provide destinationm token amount for given source amount
    * @param _src Source token
    * @param _dest Destination token
    * @param _srcAmount Amount of source tokens
    ** @return _destAmount: amount of expected destination tokens
    */
    function getDestinationReturnAmount(
        IERC20 _src,
        IERC20 _dest,
        uint256 _srcAmount
    )
        external
        view
        returns(uint256 _destAmount);

    function getDepositAddress(
        IERC20 _src,
        IERC20 _dest
    )
        external
        view
        returns(address _target);
}


contract RoutingManagement is Ownable {
    /**
    * @dev Struct of trading route
    * @param name Name of trading route.
    * @param enable The flag of trading route to check is trading route enable.
    * @param route The address of trading route.
    */
    struct Route {
      string name;
      bool enable;
      IWardenTradingRoute route;
    }

    event AddedTradingRoute(
        address indexed addedBy,
        string name,
        IWardenTradingRoute indexed routingAddress,
        uint256 indexed index
    );
    
    event UpdatedTradingRoute(
        address indexed updatedBy,
        string name,
        IWardenTradingRoute indexed routingAddress,
        uint256 indexed index
    );

    event EnabledTradingRoute(
        address indexed enabledBy,
        string name,
        IWardenTradingRoute indexed routingAddress,
        uint256 indexed index
    );

    event DisabledTradingRoute(
        address indexed disabledBy,
        string name,
        IWardenTradingRoute indexed routingAddress,
        uint256 indexed index
    );

    Route[] public tradingRoutes; // list of trading routes

    modifier onlyTradingRouteEnabled(uint _index) {
        require(tradingRoutes[_index].enable, "This trading route is disabled");
        _;
    }

    modifier onlyTradingRouteDisabled(uint _index) {
        require(tradingRoutes[_index].enable, "This trading route is enabled");
        _;
    }

    /**
    * @dev Function for adding new trading route
    * @param _name Name of trading route.
    * @param _routingAddress The address of trading route.
    ** @return length of trading routes.
    */
    function addTradingRoute(
        string calldata _name,
        IWardenTradingRoute _routingAddress
    )
      external
      onlyOwner
    {
        tradingRoutes.push(Route({
            name: _name,
            enable: true,
            route: _routingAddress
        }));
        emit AddedTradingRoute(msg.sender, _name, _routingAddress, tradingRoutes.length - 1);
    }
    
    /**
    * @dev Function for updating existing trading route
    * @param _index The uint256 of trading route index.
    * @param _name Name of trading route.
    * @param _route The address of trading route.
    */
    function updateTradingRoute(
        uint256 _index,
        string calldata _name,
        IWardenTradingRoute _route
    )
        external
        onlyOwner
    {
        tradingRoutes[_index].name = _name;
        tradingRoutes[_index].route = _route;
        emit UpdatedTradingRoute(msg.sender, _name, _route, _index);
    }

    /**
    * @dev Function for disable trading route by index
    * @param _index The uint256 of trading route index.
    ** @return length of trading routes.
    */
    function disableTradingRoute(
        uint256 _index
    )
        public
        onlyOwner
        onlyTradingRouteEnabled(_index)
    {
        tradingRoutes[_index].enable = false;
        emit DisabledTradingRoute(msg.sender, tradingRoutes[_index].name, tradingRoutes[_index].route, _index);
    }

    /**
    * @dev Function for enale trading route by index
    * @param _index The uint256 of trading route index.
    ** @return length of trading routes.
    */
    function enableTradingRoute(
        uint256 _index
    )
        public
        onlyOwner
        onlyTradingRouteDisabled(_index)
    {
        tradingRoutes[_index].enable = true;
        emit EnabledTradingRoute(msg.sender, tradingRoutes[_index].name, tradingRoutes[_index].route, _index);
    }

    /**
    * @dev Function for get amount of trading route
    * @return Amount of trading routes.
    */
    function allRoutesLength() public view returns (uint256) {
        return tradingRoutes.length;
    }

    /**
    * @dev Function for get enable status of trading route
    * @param _index The uint256 of trading route index.
    * @return enable status of trading route.
    */
    function isTradingRouteEnabled(uint256 _index) public view returns (bool) {
        return tradingRoutes[_index].enable;
    }
}


/*
* Fee collection by partner reference
*/
contract Partnership is RoutingManagement {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    /**
    * @dev Platform Fee collection
    * @param partnerIndex Partner or Wallet provider that integrate to Warden
    * @param token Token address
    * @param wallet Partner or Wallet provider wallet
    * @param amount Fee amount
    */
    event CollectFee(
      uint256 indexed partnerIndex,
      IERC20   indexed token,
      address indexed wallet,
      uint256         amount
    );

    /**
    * @dev Updating partner info
    * @param index Partner index
    * @param wallet Partner wallet
    * @param fee Fee in bps
    * @param name partner name
    */
    event UpdatePartner(
      uint256 indexed index,
      address indexed wallet,
      uint16 fee,
      bytes16 name
    );

    struct Partner {
      address wallet;       // To receive fee on the Warden Swap network
      uint16 fee;           // fee in bps
      bytes16 name;         // Partner reference
    }

    IERC20 public constant ETHER_ERC20 = IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

    mapping(uint256 => Partner) public partners;

    constructor() public {
        Partner memory partner = Partner(msg.sender, 10, "WARDEN"); // 0.1%
        partners[0] = partner;
        emit UpdatePartner(0, msg.sender, 10, "WARDEN");
    }

    function updatePartner(uint256 index, address wallet, uint16 fee, bytes16 name)
        external
        onlyOwner
    {
        require(wallet != address(0), "wallet: not allow address 0");
        require(name.length != 0, "name: not allow empty name");
        require(fee <= 100, "fee: no more than 1%");
        Partner memory partner = Partner(wallet, fee, name);
        partners[index] = partner;
        emit UpdatePartner(index, wallet, fee, name);
    }

    function _amountWithFee(uint256 amount, uint256 partnerIndex)
        internal
        view
        returns(uint256) // remainingAmount
    {
        Partner storage partner = partners[partnerIndex];
        if (partner.wallet == 0x0000000000000000000000000000000000000000) {
          partner = partners[0];
        }
        if (partner.fee == 0) {
            return amount;
        }
        uint256 fee = amount.mul(partner.fee).div(10000);
        return amount.sub(fee);
    }

    function _collectFee(uint256 partnerIndex, uint256 amount, IERC20 token)
        internal
        returns(uint256) // remainingAmount
    {
        Partner storage partner = partners[partnerIndex];
        if (partner.wallet == 0x0000000000000000000000000000000000000000) {
            partnerIndex = 0;
            partner = partners[0];
        }
        if (partner.fee == 0) {
            return amount;
        }
        uint256 fee = amount.mul(partner.fee).div(10000);
        require(fee < amount, "fee exceeds return amount!");
        if (ETHER_ERC20 == token) {
            (bool success, ) = partner.wallet.call{value: fee}(""); // Send back ether to sender
            require(success, "Transfer fee of ether failed.");
        } else {
            token.safeTransfer(partner.wallet, fee);
        }
        emit CollectFee(partnerIndex, token, partner.wallet, fee);

        return amount.sub(fee);
    }
}


contract WardenTokenPriviledge is Partnership {
    uint256 public eligibleAmount = 10 ether; // 10 WAD
    IERC20 public wardenToken;

    event UpdateWardenToken(IERC20 indexed token);
    event UpdateEligibleAmount(uint256 amount);

    function updateWardenToken(
        IERC20  token
    )
        public
        onlyOwner
    {
        wardenToken = token;
        emit UpdateWardenToken(token);
    }

    function updateEligibleAmount(
        uint256  amount
    )
        public
        onlyOwner
    {
        eligibleAmount = amount;
        emit UpdateEligibleAmount(amount);
    }

    function isEligibleForFreeTrade(address user)
        public
        view
        returns (bool)
    {
        if (address(wardenToken) == 0x0000000000000000000000000000000000000000) {
            return false;
        }
        return wardenToken.balanceOf(user) >= eligibleAmount;
    }
}

pragma solidity 0.6.12;


interface IWETH {
    function deposit() external payable;
    function transfer(address to, uint value) external returns (bool);
    function withdraw(uint) external;
}


contract WardenSwap1_5 is WardenTokenPriviledge, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    IWETH private immutable weth;
    
    mapping(bytes32 => bool) public hasLearned;
    mapping(bytes32 => uint256[]) public learnedRoutes;
    mapping(bytes32 => uint256) public learnedRoutesLength;
    mapping(bytes32 => IERC20[]) public learnedTokens;
    mapping(bytes32 => uint256) public learnedTokensLength;
    
    uint256 public learnedCount = 1;
    mapping(bytes32 => uint256) public learnedIds;
    mapping(uint256 => bytes32) public learnedHashes;
    
    mapping(IERC20 => mapping(IERC20 => bytes32[])) public tradingPairLearnedHashes;
    mapping(IERC20 => mapping(IERC20 => mapping(bytes32 => bool))) public hasTradingPairLearned;
    mapping(IERC20 => mapping(IERC20 => uint256)) public tradingPairLearnedLength;
    
    constructor(
        IWETH _weth
    ) public {
        weth = _weth;
    }

    /**
    * @dev when new trade occur (and success), this event will be boardcast.
    * @param srcAsset Source token
    * @param srcAmount amount of source token
    * @param destAsset Destination token
    * @param destAmount amount of destination token
    * @param trader user address
    */
    event Trade(
        address indexed srcAsset, // Source
        uint256         srcAmount,
        address indexed destAsset, // Destination
        uint256         destAmount,
        address indexed trader, // User
        address         receiver, // User / Merchant
        bool            cacheHit,
        bool            hasSplitted
    );
    
    /**
    * @dev learn new trading strategy.
    * @param packedHash hash of strategy data
    * @param learnedId unique id
    * @param subRoutesLength lenght of routes
    * @param correspondentTokensLength lenght of tokens
    */
    event Learn(
        bytes32 packedHash,
        uint256 indexed learnedId,
        uint256 indexed subRoutesLength,
        uint256 indexed correspondentTokensLength
    );

    /**
    * @dev makes a trade between token to token by tradingRouteIndex
    * @param tradingRouteIndex index of trading route
    * @param src Source token
    * @param srcAmount amount of source tokens
    * @param dest Destination token
    * @param fromAddress address of trader
    * @param toAddress destination address
    * @return amount of actual destination tokens
    */
    function _tradeTokenToToken(
        uint256 tradingRouteIndex,
        IERC20 src,
        uint256 srcAmount,
        IERC20 dest,
        address fromAddress,
        address toAddress
    )
        private
        returns(uint256)
    {
        // Load trading route
        IWardenTradingRoute tradingRoute = tradingRoutes[tradingRouteIndex].route;
        
        // Deposit to target
        address depositAddress = tradingRoute.getDepositAddress(src, dest);
        if (fromAddress == address(this)) {
            src.safeTransfer(depositAddress, srcAmount);
        } else if (fromAddress != 0x0000000000000000000000000000000000000000) {
            src.safeTransferFrom(fromAddress, depositAddress, srcAmount);
        }

        // Trade to route
        uint256 destAmount = tradingRoute.trade(
            src,
            dest,
            srcAmount,
            toAddress
        );
        return destAmount;
    }
    
    function _tradeStrategies(
        IERC20      _src,
        uint256     _srcAmount,
        IERC20      _dest,
        uint256[]   memory _subRoutes,
        IERC20[]    memory _correspondentTokens,
        address     _fromAddress
    )
        private
        returns(uint256 _destAmount)
    {
        IERC20 src;
        IERC20 dest;
        _destAmount = _srcAmount;
        uint256 routersLen = _subRoutes.length;
        for (uint i = 0; i < routersLen; i++) {
            src = i == 0 ? _src : _correspondentTokens[i - 1];
            dest = i == routersLen - 1 ? _dest : _correspondentTokens[i];
            
            uint256 routeIndex = _subRoutes[i];
            address fromAddress = i == 0 ? _fromAddress : 0x0000000000000000000000000000000000000000;
            address toAddress;
            
            // Advanced fetching next market address
            if (i == routersLen - 1) {
                toAddress = address(this);
            } else {
                IWardenTradingRoute tradingRoute = tradingRoutes[_subRoutes[i + 1]].route;
                IERC20 nextDest = i + 1 == routersLen - 1 ? _dest : _correspondentTokens[i + 1];
                toAddress = tradingRoute.getDepositAddress(dest, nextDest);
            }

            _destAmount = _tradeTokenToToken(routeIndex, src, _destAmount, dest, fromAddress, toAddress);
        }
    }
    
    /**
    * @dev makes a trade by providing trading strategy
    * @param _src Source token
    * @param _srcAmount amount of source tokens
    * @param _dest Destination token
    * @param _minDestAmount minimum of destination token amount
    * @param _subRoutes trading routers
    * @param _correspondentTokens intermediate tokens
    * @param _partnerIndex partner id
    * @param _receiver receiver address
    * @return _destAmount amount of actual destination tokens
    */
    function tradeStrategies(
        IERC20      _src,
        uint256     _srcAmount,
        IERC20      _dest,
        uint256     _minDestAmount,
        uint256[]   memory _subRoutes,
        IERC20[]    memory _correspondentTokens,
        uint256     _partnerIndex,
        address     _receiver
    )
        public
        payable
        nonReentrant
        returns(uint256 _destAmount)
    {
        {
            IERC20 adjustedSrc;
            IERC20 adjustedDest = ETHER_ERC20 == _dest ? IERC20(address(weth)) : _dest;
            address fromAddress;
            
            // Wrap ETH
            if (ETHER_ERC20 == _src) {
                require(msg.value == _srcAmount, "WardenSwap: Ether source amount mismatched");
                weth.deposit{value: _srcAmount}();
                
                adjustedSrc = IERC20(address(weth));
                fromAddress = address(this);
            } else {
                adjustedSrc = _src;
                fromAddress = msg.sender;
            }
        
            // Record src/dest asset for later consistency check.
            uint256 srcAmountBefore = adjustedSrc.balanceOf(fromAddress);
            uint256 destAmountBefore = adjustedDest.balanceOf(address(this));
            
            _destAmount = _tradeStrategies(
                adjustedSrc,
                _srcAmount,
                adjustedDest,
                _subRoutes,
                _correspondentTokens,
                fromAddress
            );
            
            // Sanity check
            // Recheck if src/dest amount correct
            require(adjustedSrc.balanceOf(fromAddress) == srcAmountBefore.sub(_srcAmount), "WardenSwap: source amount mismatched after trade");
            require(adjustedDest.balanceOf(address(this)) == destAmountBefore.add(_destAmount), "WardenSwap: destination amount mismatched after trade");
        }

        
        // Unwrap ETH
        if (ETHER_ERC20 == _dest) {
            weth.withdraw(_destAmount);
        }
        
        // Collect fee
        if (!isEligibleForFreeTrade(msg.sender)) {
            _destAmount = _collectFee(_partnerIndex, _destAmount, _dest);
        }

        // Throw exception if destination amount doesn't meet user requirement.
        require(_destAmount >= _minDestAmount, "WardenSwap: destination amount is too low.");
        if (ETHER_ERC20 == _dest) {
            (bool success, ) = _receiver.call{value: _destAmount}(""); // Send back ether to sender
            require(success, "WardenSwap: Transfer ether back to caller failed.");
        } else { // Send back token to sender
            _dest.safeTransfer(_receiver, _destAmount);
        }
        
        bytes memory packed = abi.encodePacked(_subRoutes, _correspondentTokens);
        bytes32 packedHash = keccak256(packed);
        
        bool isCached = hasLearned[packedHash];
        if (!isCached) {
            hasLearned[packedHash] = true;
            learnedRoutes[packedHash] = _subRoutes;
            learnedRoutesLength[packedHash] = _subRoutes.length;
            learnedTokens[packedHash] = _correspondentTokens;
            learnedTokensLength[packedHash] = _correspondentTokens.length;
            
            learnedIds[packedHash] = learnedCount;
            learnedHashes[learnedCount] = packedHash;
            
            emit Learn(packedHash, learnedCount, _subRoutes.length, _correspondentTokens.length);
            
            learnedCount += 1;
        }
        
        // Learn new trading pair
        if (!hasTradingPairLearned[_src][_dest][packedHash]) {
            hasTradingPairLearned[_src][_dest][packedHash] = true;
            tradingPairLearnedHashes[_src][_dest].push(packedHash);
            tradingPairLearnedLength[_src][_dest] += 1;
        }

        emit Trade(address(_src), _srcAmount, address(_dest), _destAmount, msg.sender, _receiver, isCached, false);
    }
    
    /**
    * @dev makes a trade by providing learned id
    * @param _src Source token
    * @param _srcAmount amount of source tokens
    * @param _dest Destination token
    * @param _minDestAmount minimum of destination token amount
    * @param _learnedId unique id
    * @param _partnerIndex partner id
    * @param _receiver receiver address
    * @return _destAmount amount of actual destination tokens
    */
    function tradeWithLearned(
        IERC20    _src,
        uint256   _srcAmount,
        IERC20    _dest,
        uint256   _minDestAmount,
        uint256   _learnedId,
        uint256   _partnerIndex,
        address   _receiver
    )
        external
        payable
        returns(uint256 _destAmount)
    {
        bytes32 learnedHash = learnedHashes[_learnedId];
        
        _destAmount = tradeStrategies(
            _src,
            _srcAmount,
            _dest,
            _minDestAmount,
            learnedRoutes[learnedHash],
            learnedTokens[learnedHash],
            _partnerIndex,
            _receiver
        );
    }
    
    function _split2(
        uint256[]   calldata _learnedIds,
        uint256[]   calldata _volumns,
        IERC20      _src,
        uint256     _totalSrcAmount,
        IERC20      _dest,
        address     _fromAddress
    )
        private
        returns (
            uint256 _destAmount
        )
    {
        // Trade with routes
        uint256 amountRemain = _totalSrcAmount;
        for (uint i = 0; i < _learnedIds.length; i++) {
            uint256 amountForThisRound;
            if (i == _learnedIds.length - 1) {
                amountForThisRound = amountRemain;
            } else {
                amountForThisRound = _totalSrcAmount.mul(_volumns[i]).div(100);
                amountRemain = amountRemain.sub(amountForThisRound);
            }
            
            bytes32 learnedHash = learnedHashes[_learnedIds[i]];
            _destAmount = _destAmount.add(
                _tradeStrategies(
                    _src,
                    amountForThisRound,
                    _dest,
                    learnedRoutes[learnedHash],
                    learnedTokens[learnedHash],
                    _fromAddress
                )
            );
        }
    }
    
    function _splitTrades(
        uint256[] calldata  _learnedIds,
        uint256[] calldata  _volumns,
        IERC20              _src,
        uint256             _totalSrcAmount,
        IERC20              _dest
    )
        private
        returns(uint256 _destAmount)
    {
        IERC20 adjustedSrc;
        IERC20 adjustedDest = ETHER_ERC20 == _dest ? IERC20(address(weth)) : _dest;
        address fromAddress;
        
        // Wrap ETH
        if (ETHER_ERC20 == _src) {
            require(msg.value == _totalSrcAmount, "WardenSwap: Ether source amount mismatched");
            weth.deposit{value: _totalSrcAmount}();
            
            adjustedSrc = IERC20(address(weth));
            fromAddress = address(this);
        } else {
            adjustedSrc = _src;
            fromAddress = msg.sender;
        }
        
        // Record src/dest asset for later consistency check.
        uint256 srcAmountBefore = adjustedSrc.balanceOf(fromAddress);
        uint256 destAmountBefore = adjustedDest.balanceOf(address(this));
        
        _destAmount = _split2(
            _learnedIds,
            _volumns,
            adjustedSrc,
            _totalSrcAmount,
            adjustedDest,
            fromAddress
        );
        
        // Sanity check
        // Recheck if src/dest amount correct
        require(adjustedSrc.balanceOf(fromAddress) == srcAmountBefore.sub(_totalSrcAmount), "WardenSwap: source amount mismatched after trade");
        require(adjustedDest.balanceOf(address(this)) == destAmountBefore.add(_destAmount), "WardenSwap: destination amount mismatched after trade");

        
        // Unwrap ETH
        if (ETHER_ERC20 == _dest) {
            weth.withdraw(_destAmount);
        }
    }

    /**
    * @dev makes a trade by splitting volumes
    * @param _learnedIds unique ids
    * @param _volumns volume percentages
    * @param _src Source token
    * @param _totalSrcAmount amount of source tokens
    * @param _dest Destination token
    * @param _minDestAmount minimum of destination token amount
    * @param _partnerIndex partner id
    * @param _receiver receiver address
    * @return _destAmount amount of actual destination tokens
    */
    function splitTrades(
        uint256[] calldata  _learnedIds,
        uint256[] calldata  _volumns,
        IERC20              _src,
        uint256             _totalSrcAmount,
        IERC20              _dest,
        uint256             _minDestAmount,
        uint256             _partnerIndex,
        address             _receiver
    )
        external
        payable
        nonReentrant
        returns(uint256 _destAmount)
    {
        require(_learnedIds.length > 0, "WardenSwap: learnedIds can not be empty");
        require(_learnedIds.length == _volumns.length, "WardenSwap: learnedIds and volumns lengths mismatched");
        
        _destAmount = _splitTrades(
            _learnedIds,
            _volumns,
            _src,
            _totalSrcAmount,
            _dest
        );
        
        // Collect fee
        if (!isEligibleForFreeTrade(msg.sender)) {
            _destAmount = _collectFee(_partnerIndex, _destAmount, _dest);
        }

        // Throw exception if destination amount doesn't meet user requirement.
        require(_destAmount >= _minDestAmount, "WardenSwap: destination amount is too low.");
        if (ETHER_ERC20 == _dest) {
            (bool success, ) = _receiver.call{value: _destAmount}(""); // Send back ether to sender
            require(success, "WardenSwap: Transfer ether back to caller failed.");
        } else { // Send back token to sender
            _dest.safeTransfer(_receiver, _destAmount);
        }

        emit Trade(address(_src), _totalSrcAmount, address(_dest), _destAmount, msg.sender, _receiver, true, true);
    }
    
    /**
    * @dev makes a trade ETH -> WETH
    * @param _receiver receiver address
    * @return _destAmount amount of actual destination tokens
    */
    function tradeEthToWeth(
        address     _receiver
    )
        external
        payable
        nonReentrant
        returns(uint256 _destAmount)
    {
        weth.deposit{value: msg.value}();
        IERC20(address(weth)).safeTransfer(_receiver, msg.value);
        _destAmount = msg.value;
        emit Trade(address(ETHER_ERC20), msg.value, address(weth), _destAmount, msg.sender, _receiver, false, false);
    }
    
    /**
    * @dev makes a trade WETH -> ETH
    * @param _srcAmount amount of source tokens
    * @param _receiver receiver address
    * @return _destAmount amount of actual destination tokens
    */
    function tradeWethToEth(
        uint256     _srcAmount,
        address     _receiver
    )
        external
        nonReentrant
        returns(uint256 _destAmount)
    {
        IERC20(address(weth)).safeTransferFrom(msg.sender, address(this), _srcAmount);
        weth.withdraw(_srcAmount);
        (bool success, ) = _receiver.call{value: _srcAmount}(""); // Send back ether to sender
        require(success, "WardenSwap: Transfer ether back to caller failed.");
        _destAmount = _srcAmount;
        emit Trade(address(weth), _srcAmount, address(ETHER_ERC20), _destAmount, msg.sender, _receiver, false, false);
    }
    
    /**
    * @dev train new trading strategy
    * @param _subRoutes trading routers
    * @param _correspondentTokens intermediate tokens
    */
    function train(
        uint256[]   calldata _subRoutes,
        IERC20[]    calldata _correspondentTokens
    )
        external
        onlyOwner
    {
        bytes memory packed = abi.encodePacked(_subRoutes, _correspondentTokens);
        bytes32 packedHash = keccak256(packed);
        
        bool isCached = hasLearned[packedHash];
        if (!isCached) {
            hasLearned[packedHash] = true;
            learnedRoutes[packedHash] = _subRoutes;
            learnedRoutesLength[packedHash] = _subRoutes.length;
            learnedTokens[packedHash] = _correspondentTokens;
            learnedTokensLength[packedHash] = _correspondentTokens.length;
            
            learnedIds[packedHash] = learnedCount;
            learnedHashes[learnedCount] = packedHash;
            
            emit Learn(packedHash, learnedCount, _subRoutes.length, _correspondentTokens.length);
            
            learnedCount += 1;
        }
    }

    // In case of an expected and unexpected event that has some token amounts remain in this contract, owner can call to collect them.
    function collectRemainingToken(
        IERC20  _token,
        uint256 _amount
    )
      external
      onlyOwner
    {
        _token.safeTransfer(msg.sender, _amount);
    }

    // In case of an expected and unexpected event that has some ether amounts remain in this contract, owner can call to collect them.
    function collectRemainingEther(
        uint256 _amount
    )
      external
      onlyOwner
    {
        (bool success, ) = msg.sender.call{value: _amount}(""); // Send back ether to sender
        require(success, "WardenSwap: Transfer ether back to caller failed.");
    }
    
    // Receive ETH in case of trade Token -> ETH
    receive() external payable {}
}