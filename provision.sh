#!/bin/sh
# this assumes the public key is created and uploaded to github
WORKSPACE=$HOME/projects
DOTFILES_DIR=$WORKSPACE/dotfiles
DOTFILES_REPO=git@github.com:aslamhadi/dotfiles.git
NVIM_CONFIG=$HOME/.config/nvim

echo "dotfiles"
mkdir -p $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR
#ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig
#ln -s $DOTFILES_DIR/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

echo "oh my zsh"
sudo apt-get update -y
sudo apt-get install -y zsh direnv
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $DOTFILES_DIR/oh-my-zsh/config.zsh $HOME/.oh-my-zsh/custom/config.zsh
sudo chsh -s `which zsh` $USER

echo "nvim"
# install
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y python-dev python-pip python3-dev python3-pip neovim
# config
mkdir -p $NVIM_CONFIG
ln -s $DOTFILES_DIR/vim/vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "python"
sudo add-apt-repository -y ppa:jonathonf/python-3.6
sudo apt-get update -y
sudo apt-get install -y python3.6

echo "nvm & node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install --lts

