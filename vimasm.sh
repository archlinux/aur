#!/bin/bash
# vimasm launcher

VIMASM_DIR="$HOME/.config/vimasm"
VIMASM_DEMO="$HOME/vimasm_demo"
DOSBOX_CFG="$HOME/.dosbox/dosbox-vimasm.conf"
NEOVIM_PLUGIN="$HOME/.config/nvim/lua/vimasm"

# Set DOSBox environment variables to fix GLX issues
export SDL_VIDEO_GL_DRIVER=1
export DOSBOX_EXTRA_ARGS="-output surface"

# 1️⃣ Copy plugin to user's Neovim lua directory
if [ ! -d "$NEOVIM_PLUGIN" ]; then
    mkdir -p "$NEOVIM_PLUGIN"
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
if [ ! -d "$VIMASM_DEMO" ]; then
    mkdir -p "$VIMASM_DEMO"
    cp /usr/share/vimasm/welcome.asm "$VIMASM_DEMO/" 2>/dev/null || true
fi

# 4️⃣ AFD debugger
if [ ! -d "/usr/local/vimasm/dos" ]; then
    sudo mkdir -p /usr/local/vimasm/dos
fi
sudo cp /usr/share/vimasm/AFD.EXE /usr/local/vimasm/dos/AFD.EXE

# 5️⃣ DOSBox config - ensure it uses surface output
if [ ! -f "$DOSBOX_CFG" ]; then
    mkdir -p "$(dirname "$DOSBOX_CFG")"
    cp /usr/share/vimasm/dosbox-vimasm.conf "$DOSBOX_CFG"
    # Force surface output in the config
    sed -i 's/output=.*/output=surface/' "$DOSBOX_CFG" 2>/dev/null || true
fi

# 6️⃣ First run: open welcome.asm
if [ ! -f "$VIMASM_DIR/.initialized" ]; then
    mkdir -p "$VIMASM_DIR"
    touch "$VIMASM_DIR/.initialized"
    if [ -f "$VIMASM_DEMO/welcome.asm" ]; then
        exec nvim "$VIMASM_DEMO/welcome.asm"
    fi
fi

# 7️⃣ Otherwise open nvim normally
exec nvim "$@"
