#!/bin/sh

link() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -L "$LINK_DIR/$file" ]; then
            unlink "$LINK_DIR/$file"
        else
            mkdir -p $(dirname "$LINK_DIR/$file")
        fi
        ln -sv "$DOTFILES_DIR/$file" "$LINK_DIR/$file"
    done
}

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

LINK_DIR=$HOME
link .xinitrc .bashrc

LINK_DIR=$CONFIG_DIR
link bspwm sxhkd kitty rofi polybar nvim
