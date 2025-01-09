if [ -n "$CONDA_PATH" ]; then
    case "$OSTYPE" in
        msys*)
            export PYIOENCODING="utf-8"
            export PYTHONIOENCODING="utf-8"

            # >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            source "$CONDA_PATH/etc/profile.d/mamba.sh"
            eval "$(${CONDA_PATH}/Scripts/conda.exe 'shell.zsh' 'hook' | sed -e 's/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@"/"$CONDA_EXE" $_CE_M $_CE_CONDA "$@" | tr -d \x27\\r\x27/g')"
            # <<< conda initialize <<<
            ;;
        *)
            # >>> conda initialize >>>
            # !! Contents within this block are managed by 'conda init' !!
            __conda_setup="$(${CONDA_PATH}/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
            if [ $? -eq 0 ]; then
                eval "$__conda_setup"
            else
                if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
                    . "$CONDA_PATH/etc/profile.d/conda.sh"
                else
                    export PATH="$CONDA_PATH/bin:$PATH"
                fi
            fi
            unset __conda_setup

            if [ -f "$CONDA_PATH/etc/profile.d/mamba.sh" ]; then
                . "$CONDA_PATH/etc/profile.d/mamba.sh"
            fi
            # <<< conda initialize <<<
            ;;
    esac
    zinit ice lucid wait"1"
    zinit light conda-incubator/conda-zsh-completion
fi