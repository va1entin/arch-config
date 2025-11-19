#!/usr/bin/env bash

ZSHRC_PATH=~/.zshrc

echo "Setting theme in ${ZSHRC_PATH}..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="maran"/' "${ZSHRC_PATH}"
echo ""

echo "Setting plugins in ${ZSHRC_PATH}..."
sed -i 's/^plugins=.*/plugins=(git)/' "${ZSHRC_PATH}"
echo ""

echo "Appending configs/zshrc to ${ZSHRC_PATH}..."
echo -e "\n" >> "${ZSHRC_PATH}"
cat configs/zshrc >> "${ZSHRC_PATH}"
echo ""
