#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
version=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r .tag_name | sed 's/^v//')
curl -sLO https://github.com/junegunn/fzf/releases/latest/download/fzf-$version-linux_amd64.tar.gz
tar xzf fzf-$version-linux_amd64.tar.gz
mv fzf ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"