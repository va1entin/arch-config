#!/usr/bin/env bash

echo "Installing syncthing..."
yay -S syncthing
echo ""

echo "Enabling and starting syncthing user service..."
systemctl enable --now --user syncthing.service
echo ""
