#!/bin/bash
#
#
# echo "Installing pyright globally...."
# sudo npm i -g pyright
echo "Dowloading packer....."
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
