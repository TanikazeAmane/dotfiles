#!/bin/bash
mkdir -p ~/.local/bin

case "$OSTYPE" in
    darwin*)
        brew install --cask font-jetbrains-mono font-meslo-lg-nerd-font
        brew install bat btop fd fzf jq lsd ncdu procs ripgrep starship tokei yazi zoxide \
            fastfetch onefetch tldr \
            gnu-tar unar p7zip par2 \
            byobu \
            axel \
            git git-lfs git-delta \
            gpg \
            pkg-config llvm lld gcc cmake ninja \
            imagemagick ffmpeg \
            lazygit \
            typst \
            huggingface-cli
        ;;
    linux*)
        if type yay &> /dev/null; then
            yay -Sy --needed bat btop fd fzf jq lsd ncdu procs ripgrep starship tokei yazi zoxide \
                fastfetch onefetch tldr \
                zip unzip unarchiver p7zip par2cmdline \
                screen byobu \
                curl axel lsof dnsutils \
                exfatprogs \
                llvm lld clang gcc cmake ninja \
                imagemagick ffmpeg \
                lazygit \
                typst \
                python-huggingface-hub
        elif type apt &> /dev/null; then
            sudo apt update -y && sudo apt install -y bat btop fd-find jq lsd ncdu ripgrep \
                tldr \
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
            $MINGW_PACKAGE_PREFIX-bat $MINGW_PACKAGE_PREFIX-fd $MINGW_PACKAGE_PREFIX-fzf $MINGW_PACKAGE_PREFIX-jq $MINGW_PACKAGE_PREFIX-lsd $MINGW_PACKAGE_PREFIX-procs $MINGW_PACKAGE_PREFIX-ripgrep $MINGW_PACKAGE_PREFIX-starship $MINGW_PACKAGE_PREFIX-yazi $MINGW_PACKAGE_PREFIX-zoxide \
            $MINGW_PACKAGE_PREFIX-fastfetch $MINGW_PACKAGE_PREFIX-onefetch $MINGW_PACKAGE_PREFIX-python-tldr --noconfirm
        pacman -S --needed base-devel $MINGW_PACKAGE_PREFIX-toolchain $MINGW_PACKAGE_PREFIX-clang-tools-extra $MINGW_PACKAGE_PREFIX-cmake --noconfirm
        ;;
esac

./link.sh