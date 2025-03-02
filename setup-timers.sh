#!/usr/bin/env bash

echo "Enabling reflector timer..."
sudo systemctl enable --now reflector.timer
echo ""

echo "Enabling yaycache timer..."
sudo systemctl enable --now yaycache.timer
echo ""
