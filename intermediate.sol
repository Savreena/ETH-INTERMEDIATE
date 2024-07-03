// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Competition {
    // Define a struct to represent a player with currency and level attributes
    struct Player {
        uint256 currency;
        uint256 level;
    }

    // Mapping to store each player's information by their address
    mapping(address => Player) public playerInfo;

    // Function to register a new player with an initial amount of currency
    function register(uint256 initialCurrency) public {
        playerInfo[msg.sender] = Player(initialCurrency, 1); // Level starts at 1
    }

    // Function to perform an action that costs currency
    function performAction(uint256 cost) public {
        require(playerInfo[msg.sender].currency >= cost, "Insufficient currency"); // Check for enough currency
        assert(playerInfo[msg.sender].level > 0); // Example rule: player must have a positive level
        playerInfo[msg.sender].currency -= cost; // Deduct the action cost
    }

    // Function to level up a player, which costs a set amount of currency
    function levelUp() public {
        uint256 cost = 100; // Define the cost for leveling up
        require(playerInfo[msg.sender].currency >= cost, "Insufficient currency"); // Check for enough currency
        playerInfo[msg.sender].currency -= cost; // Deduct the level-up cost
        playerInfo[msg.sender].level += 1; // Increase the player's level
    }

    // Function to revert an invalid move
    function invalidMove() public pure {
        revert("Invalid move");
    }
}
