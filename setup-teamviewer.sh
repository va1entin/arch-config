#!/usr/bin/env bash

echo "Starting teamviewer service"
yay -S teamviewer
sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service
echo ""
