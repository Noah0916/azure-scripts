#!/bin/bash

# Update packages
sudo apt-get update -y

# Install nginx
sudo apt-get install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx
