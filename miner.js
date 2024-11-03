const { chromium } = require('playwright');

(async () => {
  // Launch a headless browser
  const browser = await chromium.launch({
    headless: true  // Set to false if you need to see the browser for debugging
  });

  // Open a new browser page
  const page = await browser.newPage();

  // Navigate to the mining page
  await page.goto('http://localhost:3000', { waitUntil: 'networkidle' });

  console.log('Minar page loaded. Minar started.');

  // Keep the browser open to continue mining
  await page.waitForTimeout(3600000); // Keep open for 1 hour (or set as needed)

  await browser.close();
})();
