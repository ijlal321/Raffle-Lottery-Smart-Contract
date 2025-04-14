// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;


/**
 * @title Raffle
 * @author Muhammad Ijlal
 * @notice This contract is a simple implementation of a raffle system.
 * @dev Implements  ChainLink VRFv2.5
 */
contract Raffle {
    /* Custom Errors */
    error Raffle__SendMoreToEnterRaffle(); // convention -> ContractName__ErrorName.

    uint256 private immutable i_entranceFee; // immuteable and private to save gas fees.

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRuffle() payable public{
        // require(msg.value >= i_entranceFee, "Not enough ETH to enter the raffle!"); // old way. Inefficient mostly due to string involved.
        // revert(msg.value >= i_entranceFee, Raffle__SendMoreToEnterRaffle()); // new upcoming way. but alot of hassle to implement.
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle(); // custom error
        }




    }

    function pickWinner() public {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

}