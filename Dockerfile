# Use Node.js as the base image
FROM node:16

# Install necessary dependencies for Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libxcomposite1 \
    libxrandr2 \
    libnss3 \
    libxss1 \
    libxcursor1 \
    libxdamage1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libappindicator3-1 \
    libfontconfig1 \
    xdg-utils \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json, then install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port for the web server
EXPOSE 3000

# Run both the server and Puppeteer when the container starts
CMD ["sh", "-c", "node server.js & sleep 5 && node miner.js"]
