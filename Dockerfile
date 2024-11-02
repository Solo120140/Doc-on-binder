# Use Node.js base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose a port if needed (optional)
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
