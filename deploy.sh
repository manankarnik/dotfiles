#!/bin/sh

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

home_link() {
    local files=("$@")
    for file in "${files[@]}"; do
        ln -svf "$DOTFILES_DIR/$file" "$HOME/$file"
    done
}

config_link() {
    local files=("$@")
    mkdir -p "$HOME/.config"
    for file in "${files[@]}"; do
        ln -svf "$DOTFILES_DIR/$file" "$CONFIG_DIR/$file"
    done
}

home_link ".xinitrc"
config_link "bspwm" "kitty"
