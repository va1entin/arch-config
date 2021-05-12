#!/usr/bin/env bash

echo "Installing syncthing..."
sudo pacman -S syncthing
echo ""

echo "Enabling syncthing user service..."
sudo systemctl enable --user syncthing.service
echo ""

echo "Starting syncthing user service..."
sudo systemctl start --user syncthing.service
echo ""