alias upgrade="pacman -Syu --noconfirm && pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias autoremove="pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias open="_explorer_open"
alias cls="clear && ff"

drives=$(mount | sed -rn 's#^[A-Z]: on /([a-z]).*#\1#p' | tr '\n' ' ')
zstyle ':completion:*' fake-files /: "/:$drives"
unset drives

_explorer_open() {
    if [ -z "$1" ]; then
        explorer .
    else
        __path=$(cygpath -w "$1")
        if [ -d "$1" ]; then
            explorer "$__path"
        else
            start "" "$__path"
        fi
    fi
}