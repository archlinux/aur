#!/bin/bash

echo "Start update rust-analyzer!"
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
echo "End update rust-analyzer!"
echo ""
echo "Current version: $(rust-analyzer --version) ($(curl -sL https://api.github.com/repos/rust-lang/rust-analyzer/releases/latest | jq -r ".tag_name"))"
