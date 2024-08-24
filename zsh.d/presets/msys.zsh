alias upgrade="pacman -Syu --noconfirm && pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias autoremove="pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias open="explorer"
alias cls="clear && ff"

drives=$(mount | sed -rn 's#^[A-Z]: on /([a-z]).*#\1#p' | tr '\n' ' ')
zstyle ':completion:*' fake-files /: "/:$drives"
unset drives