# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias more='view -M'
alias cowtail='tail -f /var/log/moogsoft/moogfarmd.log'
alias moog='cd $MOOGSOFT_HOME'
alias bots='cd $MOOGSOFT_HOME/bots'
alias lams='cd $MOOGSOFT_HOME/lams'
alias moogstart='service moogfarmd start'
alias moogrestart='service moogfarmd restart'
alias moogstop='service moogfarmd stop'
alias moogstat='service moogfarmd status'
alias vi='vim'
alias hist='history'
alias dumprestlam='tcpdump -c 20 -s 0 -A tcp port 8888'
alias ports='netstat -nape --inet'
alias opennet='lsof -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

export MOOGSOFT_HOME=/usr/share/moogsoft
export JAVA_HOME=/usr/java/latest
export APPSERVER_HOME=/usr/share/apache-tomcat
export PATH=$PATH:$MOOGSOFT_HOME/bin:$MOOGSOFT_HOME/bin/utils
export TERM=xterm-256color



# Set some colors
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

export EDITOR=/usr/bin/vim    # the one and only editor
export HISTFILESIZE=300000    # save 300000 commands
export HISTCONTROL=ignoredups    # no duplicate lines in the history.
export HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
export PROMPT_COMMAND='history -a'
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\]'
