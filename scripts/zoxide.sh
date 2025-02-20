#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
version=$(curl -s https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest | jq -r .tag_name | sed 's/^v//')
curl -sLO https://github.com/ajeetdsouza/zoxide/releases/latest/download/zoxide-$version-x86_64-unknown-linux-musl.tar.gz
tar xzf zoxide-$version-x86_64-unknown-linux-musl.tar.gz
mv zoxide ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"