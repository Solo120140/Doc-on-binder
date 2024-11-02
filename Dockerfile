# Use Alpine as the base image
FROM node:16-alpine

# Install necessary dependencies for Puppeteer and Chromium
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json, then install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Set the Puppeteer executable path to Alpine's Chromium path
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Expose the port for the web server
EXPOSE 3000

# Run both the server and Puppeteer when the container starts
CMD ["sh", "-c", "node server.js & sleep 5 && node miner.js"]
