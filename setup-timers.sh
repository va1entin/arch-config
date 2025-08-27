#!/usr/bin/env bash

# pacman / yay

echo "Adding override to run reflector timer daily instead of weekly..."
sudo mkdir -p /etc/systemd/system/reflector.timer.d
echo "[Timer]
OnCalendar=
OnCalendar=daily" | sudo tee /etc/systemd/system/reflector.timer.d/override.conf > /dev/null
sudo systemctl daemon-reload
echo ""

echo "Enabling reflector timer..."
sudo systemctl enable --now reflector.timer
echo ""

echo "Enabling yaycache timer..."
sudo systemctl enable --now yaycache.timer
echo ""
