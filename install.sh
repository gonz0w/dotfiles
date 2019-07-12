#!/bin/bash

cp .bashrc ~
cp .inputrc ~
cp -r .vim ~
cp .vimrc ~
cp .lessfilter ~
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install ccze jq unzip python-pip wget etags-ctags figlet vim lsof htop bash-completion telnet nc psmisc sysstat tcpdump bind-utils nodejs npm jq -y
sudo npm install -g jshint
wget https://github.com/beautify-web/js-beautify/archive/master.zip && unzip master.zip && cp -rf js-beautify-master/js ~/.vim/plugin/lib/
wget https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/jsshell-linux-x86_64.zip
unzip jsshell-linux-i686.zip
mv js /usr/local/bin
mv *.so /usr/local/bin
pip install mycli
rm -rf js*.zip
cd ~/.vim
mkdir autoload && cd autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~
chmod +x .lessfilter

echo ' please run this command : source ~/.bashrc && bind -f ~/.inputrc '
