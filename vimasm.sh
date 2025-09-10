#!/bin/bash
# vimasm launcher

VIMASM_DIR="$HOME/.config/vimasm"
VIMASM_DEMO="$HOME/vimasm_demo"
DOSBOX_CFG="$HOME/.dosbox/dosbox-vimasm.conf"
NEOVIM_PLUGIN="$HOME/.config/nvim/lua/vimasm"

# Copy init.lua to user's Neovim lua directory
if [ ! -d "$NEOVIM_PLUGIN" ]; then
    mkdir -p "$NEOVIM_PLUGIN"
    cp /usr/share/vimasm/init.lua "$NEOVIM_PLUGIN/init.lua" 2>/dev/null || true
fi

# Ensure user's init.lua loads vimasm safely
NVIM_INIT="$HOME/.config/nvim/init.lua"
if [ ! -f "$NVIM_INIT" ]; then
    mkdir -p "$(dirname "$NVIM_INIT")"
    echo 'require("vimasm")' > "$NVIM_INIT"
else
    if ! grep -q "vimasm" "$NVIM_INIT"; then
        echo '' >> "$NVIM_INIT"
        echo 'require("vimasm")' >> "$NVIM_INIT"
    fi
fi

# Demo welcome file and first-run logic
if [ ! -d "$VIMASM_DEMO" ]; then
    mkdir -p "$VIMASM_DEMO"
    cp /usr/share/vimasm/welcome.asm "$VIMASM_DEMO/" 2>/dev/null || true
fi

# First run: open welcome.asm
if [ ! -f "$VIMASM_DIR/.initialized" ]; then
    mkdir -p "$VIMASM_DIR"
    touch "$VIMASM_DIR/.initialized"
    if [ -f "$VIMASM_DEMO/welcome.asm" ]; then
        exec nvim "$VIMASM_DEMO/welcome.asm"
    fi
fi

# Otherwise open nvim normally
exec nvim "$@"

