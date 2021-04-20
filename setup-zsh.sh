#!/usr/bin/env bash

echo "Installing zsh and curl..."
sudo pacman -S zsh curl
echo ""

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo ""
