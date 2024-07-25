alias upgrade="pacman -Syu --noconfirm && pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias autoremove="pacman -Qdtq | xargs -r pacman -Rns --noconfirm"
alias open="explorer"
alias cls="clear && ff"