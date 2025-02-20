#!/bin/bash
tmpdir=$(mktemp -d)
cd "$tmpdir"
curl -sLO https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip
unzip -q yazi-x86_64-unknown-linux-gnu.zip
mv yazi-x86_64-unknown-linux-gnu/ya* ~/.local/bin/
cd - > /dev/null
rm -rf "$tmpdir"