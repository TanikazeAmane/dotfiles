case "$OSTYPE" in
    darwin*)
        export UV_LINK_MODE=clone
        ;;
    linux*)
        fs_type=$(df -T . | awk 'NR==2{print $2}')
        if [[ "$fs_type" == "btrfs" ]]; then
            export UV_LINK_MODE=clone
        else
            export UV_LINK_MODE=symlink
        fi
        ;;
    msys*)
        export UV_LINK_MODE=symlink
        ;;
esac