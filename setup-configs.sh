#!/usr/bin/env zsh

echo "Creating symlink for vimrc..."
ln -s ~/git/arch-config/configs/vimrc ~/.vimrc
echo ""

echo "Setting zsh as default shell for byobu..."
echo "set -g default-shell /usr/bin/zsh" > ~/.byobu/.tmux.conf
echo "set -g default-command /usr/bin/zsh" >> ~/.byobu/.tmux.conf
echo ""