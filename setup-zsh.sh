#!/usr/bin/env bash

echo "Installing zsh and curl..."
yay -S zsh curl
echo ""

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo ""
