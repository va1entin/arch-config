#!/usr/bin/env bash

echo "Enabling paccache timer..."
sudo systemctl enable paccache.timer
echo ""

echo "Starting paccache timer..."
sudo systemctl start paccache.timer
echo ""
