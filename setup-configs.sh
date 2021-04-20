#!/usr/bin/env zsh

for sourcefile symlink in \
    "configs/vimrc" "~/.vimrc" \
    do ln -s "${sourcefile}" "${symlink}" && echo "Setup symlink from ${symlink} to ${sourcefile}"
done
