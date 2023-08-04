// SPDX-License-Identifier: FUM
pragma solidity >= 0.7.0 <= 0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/ReentrancyGuard.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Context.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Presale is ReentrancyGuard, Context, Ownable {
    mapping(address => uint) public _contributions;

    IERC20 public _token;
    uint private _tokendecimals;
    address payable public _wallet;
    uint public _rate;
    uint public _weiRaised;
    uint public endICO;
    uint public availableTokenICO;
    event TokenPurchased(address purchaser, address beneficiary, uint value, uint amount);
    event Refund(address receipient, uint amount);

    modifier icoActive() {
        require(endICO > 0 && block.timestamp < endICO && availableTokensICO > 0, "ICO must be active");
        _;
    }
    modifier icoNotActive() {
        require(endICO < block.timestamp, "ICO should not be active");
        _;
    }

}