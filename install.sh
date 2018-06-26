#!/bin/bash

cp .bashrc ~
cp .inputrc ~
cp -r .vim ~
cp .vimrc ~
cp .lessfilter ~
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install ccze jq unzip wget etags-ctags figlet vim lsof htop bash-completion telnet nc psmisc tcpdump bind-utils nodejs npm jq -y
sudo npm install -g jshint
wget https://github.com/beautify-web/js-beautify/archive/master.zip && unzip master.zip && cp -rf js-beautify-master/js ~/.vim/plugin/lib/
cd ~/.vim
mkdir autoload && cd autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~
chmod +x .lessfilter

echo ' please run this command : source ~/.bashrc && bind -f ~/.inputrc '
