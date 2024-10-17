# Use Node.js 18.4.0-alpine as the base image
FROM node:18.4.0-alpine

# Set the working directory
WORKDIR /AWS-FCJ-Management

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install nodemon globally and other project dependencies
RUN npm install -g nodemon@latest && npm install

# Copy the rest of your application code
COPY . .

# Expose the port your application will run on (assuming it's 5000)
EXPOSE 5000

# Define the command to start your application
CMD ["npm", "start"]
