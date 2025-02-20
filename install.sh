#!/bin/bash
mkdir -p ~/.local/bin

case "$OSTYPE" in
    darwin*)
        brew install --cask font-jetbrains-mono font-meslo-lg-nerd-font
        brew install bat btop fd fzf jq lsd ncdu ripgrep starship yazi zoxide \
            fastfetch onefetch tealdeer \
            gnu-tar unar p7zip \
            byobu \
            axel \
            git git-lfs git-delta \
            gpg \
            lazygit
        ;;
    linux*)
        if type yay &> /dev/null; then
            yay -Sy --needed bat btop fd fzf jq lsd ncdu ripgrep starship yazi zoxide \
                fastfetch onefetch tealdeer \
                zip unzip unarchiver p7zip \
                screen byobu \
                curl axel lsof inetutils dnsutils \
                lazygit
        elif type apt &> /dev/null; then
            sudo apt update -y && sudo apt install -y bat btop fd-find jq lsd ncdu ripgrep \
                tealdeer \
                zip unzip \
                zsh screen byobu \
                curl axel lsof dnsutils \
                git git-lfs \
                uuid-runtime
            for script in ./scripts/*.sh; do
                $script
            done
        fi
        ;;
    msys*)
        pacman -Sy --needed git zsh vim zip unzip curl axel ncdu --noconfirm
        pacman -S --needed $MINGW_PACKAGE_PREFIX-git-lfs $MINGW_PACKAGE_PREFIX-delta \
            $MINGW_PACKAGE_PREFIX-bat $MINGW_PACKAGE_PREFIX-fd $MINGW_PACKAGE_PREFIX-fzf $MINGW_PACKAGE_PREFIX-jq $MINGW_PACKAGE_PREFIX-lsd $MINGW_PACKAGE_PREFIX-ripgrep $MINGW_PACKAGE_PREFIX-starship $MINGW_PACKAGE_PREFIX-yazi $MINGW_PACKAGE_PREFIX-zoxide \
            $MINGW_PACKAGE_PREFIX-fastfetch --noconfirm
        ;;
esac

./link.sh