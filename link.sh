#!/bin/bash

create_symlink() {
    local source=$1
    local target=$2

    if [ "$OSTYPE" = "msys" ]; then
        local win_source=$(cygpath -w "$source")
        local win_target=$(cygpath -w "$target")
        if [ -e "$target" ] || [ -L "$target" ]; then
            rm -rf "$target"
        fi
        if [ -d "$source" ]; then
            cmd.exe //c "mklink /d $win_target $win_source" > /dev/null 2>&1
        else
            cmd.exe //c "mklink $win_target $win_source" > /dev/null 2>&1
        fi
    else
        ln -sfn "$source" "$target"
    fi
    echo "$target -> $source"
}

create_symlink "$(pwd)/starship/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$(pwd)/fastfetch" "$HOME/.config/fastfetch"
create_symlink "$(pwd)/.zshrc" "$HOME/.zshrc"
create_symlink "$(pwd)/zsh.d" "$HOME/.config/zsh.d"
mkdir -p "$HOME/.config/zsh.d/local"
create_symlink "$(pwd)/.clang-format" "$HOME/.clang-format"
create_symlink "$(pwd)/.condarc" "$HOME/.condarc"
create_symlink "$(pwd)/.vimrc" "$HOME/.vimrc"

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