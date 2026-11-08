#!/usr/bin/env zsh

echo "Creating symlink for zshrc..."
ln -s ~/git/arch-config/configs/zshrc ~/.zshrc
echo ""

echo "Creating symlink for tmux.conf..."
ln -s ~/git/arch-config/configs/tmux.conf ~/.tmux.conf
echo ""

echo "Creating symlink for vimrc..."
ln -s ~/git/arch-config/configs/vimrc ~/.vimrc
sudo ln -s ~/git/arch-config/configs/vimrc /root/.vimrc
echo ""

echo "Creating symlink for config.ghostty..."
mkdir -p ~/.config/ghostty/
ln -s ~/git/arch-config/configs/config.ghostty ~/.config/ghostty/config.ghostty
echo ""