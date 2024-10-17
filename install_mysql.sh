#!/bin/bash

# Set variables for MySQL RPM and database information
MYSQL_RPM_URL="https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm"
DB_HOST="RDS Endpoint"
DB_NAME="Database name"
DB_USER="Database username"
DB_PASS="Database password"


# Check if MySQL Community repository RPM already exists
if [ ! -f mysql80-community-release-el9-1.noarch.rpm ]; then
  sudo wget $MYSQL_RPM_URL
fi

# Install MySQL Community repository
sudo dnf install -y mysql80-community-release-el9-1.noarch.rpm

# Install MySQL server
sudo dnf install -y mysql-community-server

# Start MySQL server
sudo systemctl start mysqld

# Enable MySQL to start on boot
sudo systemctl enable mysqld

# Check MySQL version
mysql -V

# Secure the MySQL server
sudo mysql_secure_installation

# Create or update the .env file with database information
echo "DB_HOST=$DB_HOST" >> .env
echo "DB_NAME=$DB_NAME" >> .env
echo "DB_USER=$DB_USER" >> .env
echo "DB_PASS=$DB_PASS" >> .env

# Connect to MySQL and create a new database (you might want to add specific SQL commands here)
mysql -h $DB_HOST -P 3306 -u $DB_USER -p$DB_PASS
