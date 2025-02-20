#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
curl -sLO https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.tar.gz
tar xzf fastfetch-linux-amd64.tar.gz
mv fastfetch-linux-amd64/usr/bin/fastfetch ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"