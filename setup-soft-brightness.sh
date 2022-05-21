#!/usr/bin/env bash

SB_VERSION=30

echo "Downloading soft-brightness version ${SB_VERSION}..."
wget "https://github.com/F-i-f/soft-brightness/releases/download/v${SB_VERSION}/soft-brightness@fifi.org.v${SB_VERSION}.shell-extension.zip"
echo ""

echo "Creating extension directory..."
mkdir ~/.local/share/gnome-shell/extensions/soft-brightness@fifi.org
echo ""

echo "Unzipping soft-brightness..."
unzip -q "soft-brightness@fifi.org.v${SB_VERSION}.shell-extension.zip" -d ~/.local/share/gnome-shell/extensions/soft-brightness@fifi.org
echo ""

echo "Enabling soft-brightness with gnome-extensions..."
gnome-extensions enable soft-brightness@fifi.org
echo ""

echo "Removing zip file after extraction..."
rm soft-brightness@fifi.org.v${SB_VERSION}.shell-extension.zip
echo ""
