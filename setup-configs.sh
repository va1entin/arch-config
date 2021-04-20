#!/usr/bin/env zsh

ln -s ~/git/arch-config/configs/vimrc ~/.vimrc

echo "set -g default-shell /usr/bin/zsh" > ~/.byobu/.tmux.conf
echo "set -g default-command /usr/bin/zsh" >> ~/.byobu/.tmux.conf
