#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups
alias ls="lsd"
alias ssh="kitten ssh"
eval $(starship init bash)
