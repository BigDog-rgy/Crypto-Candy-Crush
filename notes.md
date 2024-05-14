# Crypto Candy Crush

## Questions
* If gameplay happens all on frontend, how to ensure no cheating, fair enforcement of rules, players can't modify scores or send a score to contract without playing game?
    * Possible need for contract (or oracle) to verify scores and send to CRUSH contract


## Getting Started
### Installation
* `curl -L https://foundry.paradigm.xyz | bash`
* `npm install --save-dev hardhat`
* `npm init -y`
* `npx create-next-app`
* `npx hardhat`

### Startup
* activate python venv:
`source myenv/bin/activate`

* frontend: 
`cd crypto-candy-crush`
`npm run dev`


## Tokens
### ERC20s
* wETH: Fee to play Crypto Candy Crush
* CRUSH: Token rewarded for gameplay, can be burned to purchase NFT PFP from store
### ERC721
* CNDY: NFTs that can be purchased via the store and used as PFPs and give special in-game powers; can be traded amongst users


## Contracts
* CNDYContract: Handles the minting and transfering of CNDY NFTs; manage metadata for each NFT (img, in-game attributes)
* CRUSHContract: Collects wETH entry fees, mints CRUSH rewards, burning CRUSH for CNDY
* GamePlay: Recieves user scores from frontend; maintains record of high score; calculates CRUSH reward relative to high score (ex: new high score = 100 CRUSH, 96% of high score = 96 CRUSH)


## Roles
* Player: User playing a round of Crypto Candy Crush, pays game fee for access and recieves CRUSH as reward.

## NFT Setup
Heroes and Villains: Game Mechanics
Hero Characters (Positive Power-Ups)

Purpose: Players can acquire heroes through achievements, purchases, or rare drops. These characters provide helpful effects to boost player scores or assist in completing difficult levels.
Examples:
Vitalik Buterin: "Fork" – Splits all pieces into two for double the matches.
Milady: "Meme Magic" – Clears all similar pieces on the board.
CZ: "Flash Crash" – Clears random pieces from the board.
Cobie: "Market Maker" – Automatically arranges five pieces into a line for a combo.
Evil Characters (Negative Power-Downs)

Purpose: These characters randomly appear during gameplay, introducing challenges and disruptions that players must overcome. Their appearance can be tied to specific triggers, such as reaching a certain score threshold or time limit on a level, adding a layer of unpredictability and challenge.
Examples:
Richard Heart: "Pulse Drain" – Halves the points players earn for a limited time.
Caroline Ellison: "Liquidity Lock" – Random pieces become locked and unmovable for several moves.
Gary Gensler: "Regulatory Freeze" – Freezes a row or column, making it unmovable for a few turns.
Charles Hoskinson: "Centralize" – Reduces the effects of all active power-ups, simulating a centralization penalty.


## Frontend Gameplay
