export PATH="$HOME/.local/bin:$PATH"
export KERNEL_INFO=$([[ $OSTYPE == msys* ]] && uname -s || uname -sr)

eval "$(starship init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

unsetopt flowcontrol
stty -ixon

alias ls="lsd"
alias tree="lsd --tree"

export ZSHRC_PRESET_DIR=$HOME/.config/zsh.d/presets
export ZSHRC_LOCAL_DIR=$HOME/.config/zsh.d/local
export TERMINAL_HEIGHT_THRESHOLD=30

case "$OSTYPE" in
    darwin*)
        source $ZSHRC_PRESET_DIR/darwin.zsh
        ;;
    linux*)
        source $ZSHRC_PRESET_DIR/linux.zsh
        ;;
    msys*)
        source $ZSHRC_PRESET_DIR/msys.zsh
        ;;
esac

() {
    local f
    for f in $ZSHRC_LOCAL_DIR/*.zsh(N.); do
        . $f
    done
}

_ff() {
    if [[ $LINES -lt $TERMINAL_HEIGHT_THRESHOLD ]]; then
        fastfetch --pipe false --config $HOME/.config/fastfetch/ff.jsonc
    else
        fastfetch --pipe false
    fi
}

alias ff="_ff"
ff

zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::git

zinit wait lucid for \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::history.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

zinit wait lucid for \
    blockf \
        zsh-users/zsh-completions \
    atload"_zsh_autosuggest_start; unalias zi" \
        zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color=always --icon=always -1 $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd --color=always --icon=always -1 $realpath'
if [[ $FZF_PREVIEW -eq 1 ]]; then
    BAT_COMMAND="bat"
    if type batcat &>/dev/null; then
        BAT_COMMAND="batcat"
    fi
    zstyle ':fzf-tab:complete:vim:*' fzf-preview '
        if [[ -f $realpath ]]; then
            '$BAT_COMMAND' --color=always --style=numbers --line-range=:200 $realpath
        elif [[ -d $realpath ]]; then
            lsd --color=always --icon=always -1 $realpath
        else
            echo $realpath
        fi
    '
fi
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit as="completion" for \
  OMZP::rust/_rustc

eval "$(zoxide init zsh)"
source <(fzf --zsh)

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

if type uv &>/dev/null; then
    zinit ice wait lucid
    source $ZSHRC_PRESET_DIR/uv.zsh
fi