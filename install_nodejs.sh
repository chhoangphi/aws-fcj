#!/bin/bash

# Colors for formatting
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if NVM is already installed
if ! command -v nvm &> /dev/null; then
  # Step 1: Install nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  source ~/.nvm/nvm.sh
fi

# Verify nvm installation
nvm --version

# Install LTS version of Node.js
nvm install --lts

# Use the installed LTS version
nvm use --lts

# Verify the Node.js and npm installation
node -v
npm -v

# Step 4: Create a package.json file (if it doesn't exist)
if [ ! -f package.json ]; then
  npm init -y
  echo -e "${GREEN}package.json created.${NC}"
fi

# Step 5: Install required npm packages
echo -e "Installing required npm packages..."
npm install express dotenv express-handlebars body-parser mysql

# Step 6: Install nodemon as a development dependency
echo -e "Installing nodemon as a development dependency..."
npm install --save-dev nodemon
npm install -g nodemon


# Step 7: Add npm start script to package.json
if ! grep -q '"start":' package.json; then
  npm set-script start "index.js"  # Replace "your-app.js" with your entry point file
  echo -e "${GREEN}npm start script added to package.json.${NC}"
fi

echo -e "${GREEN}Setup complete. You can now start building and running your Node.js application using 'npm start'.${NC}"
