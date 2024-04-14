# Crypto Candy Crush

## Getting Started
### Installation
* `curl -L https://foundry.paradigm.xyz | bash`
* `npm install --save-dev hardhat`
* `npm init -y`
* `npx create-next-app`
* `npx hardhat`

### Startup
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


## Frontend Gameplay


## Questions
* What if no market for token (strictly earned from gameplay), but sales of NFTs?