# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

EDITOR=vim
export EDITOR

alias mplayer="mplayer -vo vdpau"
alias ls="ls -h --color=auto"

# User specific aliases and functions
PS1='\[\e[36m\][\u@\h \W]\$\[\e[0m\] '


# for colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[1;37m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[1;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
