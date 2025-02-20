#!/bin/bash

create_symlink() {
    local source=$1
    local target=$2
    ln -sfn "$source" "$target"
    echo "$target -> $source"
}

mkdir -p ~/.config

create_symlink "$(pwd)/starship/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$(pwd)/fastfetch" "$HOME/.config/fastfetch"
create_symlink "$(pwd)/zsh.d" "$HOME/.config/zsh.d"
mkdir -p "$HOME/.config/zsh.d/local"
create_symlink "$(pwd)/.zshrc" "$HOME/.zshrc"
create_symlink "$(pwd)/.clang-format" "$HOME/.clang-format"
create_symlink "$(pwd)/.condarc" "$HOME/.condarc"
create_symlink "$(pwd)/.vimrc" "$HOME/.vimrc"
create_symlink "$(pwd)/.wezterm.lua" "$HOME/.wezterm.lua"

case "$OSTYPE" in
    darwin*)
        create_symlink "$(pwd)/gitconfig/unix" "$HOME/.gitconfig"
        create_symlink "$(pwd)/.hushlogin" "$HOME/.hushlogin"
        ;;
    linux*)
        create_symlink "$(pwd)/gitconfig/unix" "$HOME/.gitconfig"
        ;;
    msys*)
        create_symlink "$(pwd)/gitconfig/msys" "$HOME/.gitconfig"
        ;;
esac