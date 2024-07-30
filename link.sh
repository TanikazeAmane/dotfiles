#!/bin/bash

create_symlink() {
    local source=$1
    local target=$2
    ln -sfn "$source" "$target"
    echo "$target -> $source"
}

create_symlink "$(pwd)/starship/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$(pwd)/fastfetch" "$HOME/.config/fastfetch"
create_symlink "$(pwd)/.zshrc" "$HOME/.zshrc"
create_symlink "$(pwd)/.zsh.d" "$HOME/.zsh.d"
mkdir -p "$HOME/.zsh.d/local"
create_symlink "$(pwd)/.clang-format" "$HOME/.clang-format"
create_symlink "$(pwd)/.condarc" "$HOME/.condarc"
create_symlink "$(pwd)/.vimrc" "$HOME/.vimrc"

case "$OSTYPE" in
    msys*)
        create_symlink "$(pwd)/gitconfig/msys" "$HOME/.gitconfig"
        ;;
    *)
        create_symlink "$(pwd)/gitconfig/unix" "$HOME/.gitconfig"
        ;;
esac

if [ "$OSTYPE" == darwin* ]; then
    create_symlink "$(pwd)/.hushlogin" "$HOME/.hushlogin"
fi