#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
curl -sLO https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
tar xzf starship-x86_64-unknown-linux-gnu.tar.gz
mv starship ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"