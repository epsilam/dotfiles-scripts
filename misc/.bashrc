#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\e[1;30m┌─╼ \w\e[m\n\e[1;30m└─╼\e[m '

export VISUAL=vim
export EDITOR="vim"
export PATH=$PATH:~/scripts
export QT_QPA_PLATFORMTHEME=qt5ct
export HISTCONTROL=ignorespace

alias ls='ls --color=auto'
alias vim='vim --servername vim'
alias i3c='vim ~/style/i3-main'
alias xre='xrdb -load ~/.Xresources'
alias bgset='feh --bg-fill'
alias chu='checkups'
alias em='emacs -nw'
alias rr='ranger'
alias k='setxkbmap'
alias a='archey3'
alias p3='python3'
alias pi='python3 -i'

#This command is an alternative to ls, and displays the total size of each directory and file in the current location and sorts by size.
alias lsl='du -cksh * | sort -rh'
