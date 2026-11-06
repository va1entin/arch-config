#!/usr/bin/env zsh

echo "Creating symlink for vimrc..."
ln -s ~/git/arch-config/configs/vimrc ~/.vimrc
sudo ln -s ~/git/arch-config/configs/vimrc /root/.vimrc
echo ""

echo "Creating symlink for tmux.conf..."
ln -s ~/git/arch-config/configs/tmux.conf ~/.tmux.conf
echo ""
