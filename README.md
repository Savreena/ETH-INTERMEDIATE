# Description
The Competition smart contract is intended to manage a basic gaming environment in which users can sign up, perform works that use virtual currency, spend currency to level up, and deal with improper actions.

# Getting Started
## Requirement
1. Registering as a Player: By using the enrol option and providing a starting cash amount, players can register. The contract contains information about their registration, such as initial money and level (which starts at 1).

2. Handling of Currency: If players have enough capital and a positive level (Rank > 0), they can conduct actions that take a certain quantity of money out of their account.

3. Increasing in Level: By invoking the progress function, which subtracts 100 units of currency and increases the level if the player meets the currency threshold, players can raise their rank, or level.

4. Error Resolution: A pure function invalidaction that always returns with the error message "Move is invalid" is included in the contract. The game logic can handle invalid situations or actions with this function.

5. Information Storage: Player information is kept in a mapping (players) that is indexed by the Ethereum address of each player, including their level (Rank) and currency (capital). This makes it possible to maintain and retrieve player data within the contract with ease.

#Executing program To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.ethintermediate.sol ). Copy and paste the following code into the file:
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Competition {
    // Define a struct to represent a player with currency and level attributes
    struct Gamer {
        uint256 capital;
        uint256 Rank;
    }

    // Mapping to store each player's information by their address
    mapping(address => Gamer) public players;

    // Function to register a new player with an initial amount of currency
    function enroll(uint256 initialCapital) public {
        players[msg.sender] = Gamer(initialCapital, 1); // Level starts at 1
    }

    // Function to perform an action that costs currency
    function execute(uint256 value) public {
        require(players[msg.sender].capital >= value, "currency is insufficient"); // Check for enough currency
        assert(players[msg.sender].Rank > 0); // Example rule: player must have a positive level
        players[msg.sender].capital -= value; // Deduct the action cost
    }

    // Function to level up a player, which costs a set amount of currency
    function progress() public {
        uint256 value = 100; // Define the cost for leveling up
        require(players[msg.sender].capital >= value, "currency is insufficient"); // Check for enough currency
        players[msg.sender].capital -= value; // Deduct the level-up cost
        players[msg.sender].Rank += 1; // Increase the player's level
    }

    // Function to revert an invalid move
    function invalidaction() public pure {
        revert("Move is invalid");
    }
}
```
Select the "Solidity Compiler" tab from the sidebar on the left to begin compiling the code. Click "Compile ethintermediate.sol" after ensuring that the "Compiler" option is selected to "0.8.0" (or another compatible version).
Selecting the "Deploy & Run Transactions" tab from the left-hand sidebar will allow you to deploy the contract after the code has been compiled. To register candidates, use the code.Run the code using several candidate details.Verify that the code functions as intended.


#Author

@Savreena Kaushal

#License

This Ethintermediate is licensed under the MIT license
