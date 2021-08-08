#!/usr/bin/env bash

echo "Cloning TeamViewer AUR..."
cd ~/git && git clone https://aur.archlinux.org/teamviewer.git
echo ""

echo "Installing package..."
cd ~/git/teamviewer && makepkg -si
echo ""
