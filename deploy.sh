#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

home_link() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -e "$HOME/$file" ]; then
            mv "$HOME/$file" "$HOME/.cache/$file.old"
        fi
        ln -svi "$DOTFILES_DIR/$file" "$HOME/$file"
    done
}

config_link() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -e "$CONFIG_DIR/$file" ]; then
            mv "$CONFIG_DIR/$file" "$HOME/.cache/$file.old"
        fi
        ln -svi "$DOTFILES_DIR/$file" "$CONFIG_DIR/$file"
    done
}

home_link .xinitrc
config_link bspwm sxhkd kitty rofi polybar
