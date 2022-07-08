// npx hardhat run --network localhost scripts/mint.js

async function main(network) {
  const collection = await ethers.getContractAt(
    "XakusiCollection",
    "0x7172e488bE104bb39f12eC8E3b77962D3066e379"
  );

  let tokenID = await collection.mintToken(
    "bafkreih5gu3er5ndo7nltfumvm6nymjshmf2ggrzqaiyyc5yckzavfrlpq"
  );

  console.log(tokenID);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
