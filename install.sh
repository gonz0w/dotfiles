#!/bin/bash

mv .* ~
sudo yum install wget etags-ctags figlet vim lsof htop bash-completion tcpdump -y
source ~/.bashrc
bind -f ~/.inputrc
cd ~/.vim
mkdir autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall



