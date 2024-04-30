// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
Invariants: 
1) `_totalSupply` -> should always equal sum of CRUSH balances in `_balances`
    When CRUSH is minted or burned, `_totalSupply` should be updated accordingly
2) `mint()` -> CRUSH should only be mintable by the contract owner
    Should not allow for minting to the 0 address
    Minting only allowed if player actually played the game
    Rewarded CRUSH should be == to calculated CRUSH rewards based on gameplay score
    Player can only call `mint()` 1 time for each game score they receive
    Players should not be able to call `mint()` with a game score from a previous raffle epoch
    A player should not be able to use another player's game score to mint CRUSH
3) `burn()` -> Users should only be able to mint CRUSH from their own balances
    Users cannot burn more CRUSH than is in their balance
    After burning, the user's balance and the total supply should decrease by the same amount
    After successfully burning CRUSH, user should receive their CNDY nft
    Users cannot burn CRUSH if it would make their `_balance` negative
4) `_balances` -> No user should have a negative CRUSH balance at any time
    Array should not allow for duplicate addresses
*/

import {CRUSHContract} from "../contracts/CRUSHContract.sol";
import {Test, console} from "../lib/forge-std/src/Test.sol";

contract CRUSHTest is Test {
    CRUSHContract crush;
    address user;
    address owner;

    function setUp() public {
        crush = new CRUSHContract(); // Deploy the CRUSH Contract
        user = address(this); // Using test contract's addy as user

        vm.prank(crush.owner()); // Simulate the call from the owner
        crush.mint(user, 100); // Mint the user 100 CRUSH

        owner = crush.owner(); // Get the owner from CRUSHContract
    }

    function testOnlyOwnerCanMint() public {

    }

    function testCannotMintToZeroAddress() public {

    }

    function testBalanceUpdatedOnMint() public {

    }

    function testTotalSupplyUpdatedOnMint() public {
        
    }

    function testCannotBurnMoreThanBalance() public {
        uint256 burnAmount = 101; // user has balance of 100
        vm.prank(user);

        vm.expectRevert(bytes("Burn amount exceeds balance"));
        crush.burn(burnAmount);
    }
}