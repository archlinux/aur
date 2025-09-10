#!/bin/bash
# vimasm launcher

# Directories
VIMASM_DIR="$HOME/.config/vimasm"
VIMASM_DEMO="$HOME/vimasm_demo"
DOSBOX_CFG="$HOME/.dosbox/dosbox-vimasm.conf"
NEOVIM_PLUGIN="$HOME/.config/nvim/lua/vimasm"

# 1️⃣ Copy plugin to user's Neovim directory
NEOVIM_PLUGIN="$HOME/.config/nvim/lua/vimasm"
if [ ! -d "$NEOVIM_PLUGIN" ]; then
    mkdir -p "$(dirname "$NEOVIM_PLUGIN")"
    cp /usr/share/vimasm/init.lua "$NEOVIM_PLUGIN/init.lua" 2>/dev/null || true
fi

# 2️⃣ Ensure user's init.lua loads vimasm safely
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

# 3️⃣ Demo welcome file and first-run logic
VIMASM_DEMO="$HOME/vimasm_demo"
if [ ! -d "$VIMASM_DEMO" ]; then
    mkdir -p "$VIMASM_DEMO"
    cp /usr/share/vimasm/welcome.asm "$VIMASM_DEMO/" 2>/dev/null || true
fi

# First run: open welcome.asm
VIMASM_DIR="$HOME/.config/vimasm"
if [ ! -f "$VIMASM_DIR/.initialized" ]; then
    touch "$VIMASM_DIR/.initialized"
    if [ -f "$VIMASM_DEMO/welcome.asm" ]; then
        exec nvim "$VIMASM_DEMO/welcome.asm"
    fi
fi

# Otherwise open nvim normally
exec nvim "$@"

