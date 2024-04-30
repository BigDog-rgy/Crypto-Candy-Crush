// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title Crypto Candy Crush CRUSH Contract
/// @author BigDog
/// @dev Collects wETH entry fees, calculates earnings and mints CRUSH rewards from gameplay, keeps record of CRUSH holdings to addresses, allows for burning of CRUSH for CNDY, and handles deprication of CRUSH when idle.

//todo recieveing user scores from frontend gameplay, calculating CRUSH rewards from score, decay mechanism for idle CRUSH

contract CRUSHContract {
    mapping(address => uint256) private _balances;
    uint256 private _totalSupply; 
    address public owner;

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    //q should we import from openzeppelin
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    //q is it possible to mint CRUSH from other players scores
    //q how users will call mint with the score of their gameplay, then calculated to how much CRUSH they recieve
    //q is it more gas efficient to mint multiple players their CRUSH rewards in single tx/function call
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to the zero address!");
        _balances[to] += amount;
        _totalSupply += amount;
        emit Mint(to, amount);
    }

    //q can you only burn your own tokens
    function burn(uint256 amount) public {
        require(_balances[msg.sender] >= amount, "Burn amount exceeds balance");
        _balances[msg.sender] -= amount;
        _totalSupply -= amount;
        emit Burn(msg.sender, amount);
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function getTotalSupply() public view returns (uint256) {
        return _totalSupply;
    }
}