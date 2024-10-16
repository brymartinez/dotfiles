#!/bin/sh
# Change these if you want
GIT_USER="Bryan Martinez"
GIT_EMAIL="27615559+brymartinez@users.noreply.github.com"

# Make sure wget, curl, git, zsh, and stow are installed
which wget curl git zsh stow
if [ $? -ne 0 ]; then
  exit 1
fi

# Install Meslo NF
echo "Installing Meslo NF Regular..."
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
&& fc-cache -fv

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
yes | RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k
echo "Installing p10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install neovim
echo "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# tmux
echo "Installing tmux..."
apt install -y tmux

# Git commands
echo "Setting git commands..."
git config --global init.defaultBranch main
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USER}"

# Software deps (nvm, go, python)
echo "Installing software dependencies..."

# Other deps (fzf, commitizen, jest, ...) 
echo "Installing other dependencies..."

# Stow
echo "Stowing..."
stow --adopt .

echo "DONE!"
