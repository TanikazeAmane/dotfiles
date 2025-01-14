export HOMEBREW_NO_ANALYTICS=1

alias upgrade="brew update && brew upgrade --greedy && brew cleanup --prune=all"

if [ "$TERM_PROGRAM" = "vscode" ]; then
    alias cls="clear && ff"
elif [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]; then
    alias cls="printf '\33c\e[3J' && ff"
elif [ "$TERM_PROGRAM" = "iTerm.app" ]; then
    alias cls="printf '\e]1337;ClearScrollback\a' && ff"
    source $ZSHRC_PRESET_DIR/iterm2_shell_integration.zsh
else
    alias cls="clear && ff"
fi