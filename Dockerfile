# Use Playwright’s official Alpine image with Node.js
FROM mcr.microsoft.com/playwright:v1.48.2-focal

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install express

# Copy the rest of the application code
COPY . .

# Expose the port for the web server
EXPOSE 3000

# Run both the server and Playwright script when the container starts
CMD ["sh", "-c", "node server.js & sleep 5 && node miner.js"]
