#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

home_link() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -L "$HOME/$file" ]; then
            unlink "$HOME/$file"
        fi
        ln -sv "$DOTFILES_DIR/$file" "$HOME/$file"
    done
}

config_link() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -L "$CONFIG_DIR/$file" ]; then
            unlink "$CONFIG_DIR/$file"
        fi
        ln -sv "$DOTFILES_DIR/$file" "$CONFIG_DIR/$file"
    done
}

home_link .xinitrc .bashrc
config_link bspwm sxhkd kitty rofi polybar
