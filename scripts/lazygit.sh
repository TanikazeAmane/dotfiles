#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
version=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | jq -r .tag_name | sed 's/^v//')
curl -sLO https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${version}_Linux_x86_64.tar.gz
tar xzf lazygit_${version}_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"