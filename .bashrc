#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups
alias ls="lsd"
alias ssh="kitten ssh"
eval $(starship init bash)

export TERM="xterm-256color"
export TERMINAL="kitty"
