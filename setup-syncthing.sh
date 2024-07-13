#!/usr/bin/env bash

echo "Installing syncthing..."
yay -S syncthing
echo ""

echo "Enabling syncthing user service..."
systemctl enable --user syncthing.service
echo ""

echo "Starting syncthing user service..."
systemctl start --user syncthing.service
echo ""
