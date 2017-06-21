#!/bin/bash

cp .bashrc ~
cp .inputrc ~
cp -r .vim ~
cp .vimrc ~
cp .lessfilter ~
sudo yum install wget etags-ctags figlet vim lsof htop bash-completion telnet nc psmisc tcpdump bind-utils -y
source ~/.bashrc
bind -f ~/.inputrc
cd ~/.vim
mkdir autoload && cd autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~
chmod +x .lessfilter
rm -rf dotfiles



