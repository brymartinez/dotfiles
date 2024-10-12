#!/bin/sh
# Change these if you want
GIT_USER="Bryan Martinez"
GIT_EMAIL="27615559+brymartinez@users.noreply.github.com"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Install vim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Git commands
git config --global init.defaultBranch main
git config --global user.email "${GIT_USER}"
git config --global user.name "${GIT_EMAIL}"

