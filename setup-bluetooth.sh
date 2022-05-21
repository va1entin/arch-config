#!/usr/bin/env bash

echo "Enabling bluetooth service and starting it immediately..."
systemctl enable --now bluetooth
echo "Done!"
