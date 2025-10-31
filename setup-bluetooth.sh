#!/usr/bin/env bash

echo "Enabling bluetooth service and starting it immediately..."
systemctl enable --now bluetooth
echo "Done!"

echo "Unblocking bluetooth via rfkill..."
rfkill unblock bluetooth
echo "Done!"

echo "Powering on bluetooth adapter..."
bluetoothctl power on
echo "Done!"
