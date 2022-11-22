#!/usr/bin/env bash

echo "Starting teamviewer service"
sudo systemctl enable teamviewerd.service
sudo systemctl start teamviewerd.service
echo ""
