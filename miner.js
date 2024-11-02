// miner.js
const CoinHive = require('coin-hive'); // CoinIMP library

(async () => {
  // Create miner
  const logo = await CoinHive('281055eef367a9855fdb62a23d83071e3bef654d3cc32afb5ef1172bdde61f30'); // Replace 'YOUR_SITE_KEY' with your CoinIMP site key

  // Start the miner
  await logo.start();

  console.log('Logo started!');

  // Listen on events
  miner.on('found', () => console.log('Hash found!'));
  miner.on('accepted', () => console.log('Hash accepted by the loog!!'));
  miner.on('update', (data) => {
    console.log(`
      Hashes per second: ${data.hashesPerSecond}
      Total hashes: ${data.totalHashes}
      Accepted hashes: ${data.acceptedHashes}
    `);
  });
})();
