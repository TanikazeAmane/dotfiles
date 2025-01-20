if [ -n "$CONDA_PATH" ]; then
    case "$OSTYPE" in
        msys*)
            export PYIOENCODING="utf-8"
            export PYTHONIOENCODING="utf-8"

            # >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            eval "$(cat "$CONDA_PATH/etc/profile.d/mamba.sh" | sed -e 's/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@"/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@" | tr -d \x27\\r\x27/g')"
            eval "$(cat "$CONDA_PATH/etc/profile.d/conda.sh" | sed -e 's/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@"/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@" | tr -d \x27\\r\x27/g')"
            # <<< conda initialize <<<
            ;;
        *)
            # >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            source "$CONDA_PATH/etc/profile.d/conda.sh"
            source "$CONDA_PATH/etc/profile.d/mamba.sh"
            # <<< conda initialize <<<
            ;;
    esac
    zinit ice lucid wait"1"
    zinit light conda-incubator/conda-zsh-completion
fi