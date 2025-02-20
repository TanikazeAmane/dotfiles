if type yay &> /dev/null; then
    alias upgrade="yay -Syu --noconfirm && yay -Yc --noconfirm"
    alias autoremove="yay -Yc --noconfirm"
elif type apt &> /dev/null; then
    alias upgrade="sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y"
    alias autoremove="sudo apt autoremove -y"
    alias bat="batcat"
    alias fd="fdfind"
fi

alias open="xdg-open"
alias cls="clear && ff"