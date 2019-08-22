#!/bin/bash
# this assumes the public key is created and uploaded to github
WORKSPACE=$HOME/projects
DOTFILES_DIR=$WORKSPACE/dotfiles
DOTFILES_REPO=git@github.com:aslamhadi/dotfiles.git
DIRCOLORS_DIR=$WORKSPACE/dircolors-solarized
DIRCOLORS_REPO=https://github.com/seebi/dircolors-solarized
NVIM_CONFIG=$HOME/.config/nvim

echo "dotfiles"
mkdir -p $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/tmux/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_DIR/bashrc $HOME/.bash_aliases

echo "color scheme"
git clone $DIRCOLORS_REPO $DIRCOLORS_DIR

# echo "oh my zsh"
# sudo apt-get update -y
# sudo apt-get install -y zsh 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ln -s $DOTFILES_DIR/oh-my-zsh/config.zsh $HOME/.oh-my-zsh/custom/config.zsh
# sudo chsh -s `which zsh` $USER

echo "nvim"
# install
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y python-dev python-pip python3-dev python3-pip neovim direnv

# config
mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vim/vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source $HOME/.bashrc
nvm install --lts
npm install -g bs-platform
