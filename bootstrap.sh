#!/bin/sh
# Change these if you want
GIT_USER="Bryan Martinez"
GIT_EMAIL="27615559+brymartinez@users.noreply.github.com"
# Make sure wget, curl, git, and zsh are installed

wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
&& cd ~/.local/share/fonts \
&& fc-cache -fv
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install vim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# tmux

# Git commands
git config --global init.defaultBranch main
git config --global user.email "${GIT_USER}"
git config --global user.name "${GIT_EMAIL}"

# Software deps (nvm, go, python)
# Other deps (fzf, commitizen, jest, ...) 
# Stow
stow --adopt .
