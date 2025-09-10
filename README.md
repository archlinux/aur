# VimAsm
<p align="center">
  <img src="https://img.shields.io/badge/Neovim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim">
  <img src="https://img.shields.io/badge/Assembly-8A2BE2?style=for-the-badge&logo=assemblyscript&logoColor=white" alt="Assembly">
  <img src="https://img.shields.io/badge/NASM-000000?style=for-the-badge&logo=nasm&logoColor=white" alt="NASM">
  <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" alt="Lua">
  <img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script">
  <img src="https://img.shields.io/badge/DOSBox-000000?style=for-the-badge&logo=dosbox&logoColor=white" alt="DOSBox">
  <img src="https://img.shields.io/badge/AUR-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white" alt="AUR">
  <img src="https://img.shields.io/badge/Yay-FF8700?style=for-the-badge&logo=arch-linux&logoColor=white" alt="Yay">
</p>

Neovim assembly development environment for 8088/8086 NASM programming with DOSBox integration.

## Features

- **:Nc** - Compile and run assembly code
- **:Nd** - Compile and debug with AFD debugger  
- Auto NASM syntax highlighting
- DOSBox configuration optimized for assembly
- Includes AFD (Assembly File Debugger)

## Quick Start
<p align="center">
  <img src="https://github.com/user-attachments/assets/ecd1220f-80aa-4862-a25c-6cd14e7a47a5" width="300" style="margin-right:5px;">
  <img src="https://github.com/user-attachments/assets/558b1709-1209-474a-a28a-471e74c71dd2" width="300" style="margin-right:5px;">
  <img src="https://github.com/user-attachments/assets/863c7725-a10c-4e63-b22d-98a888d0264c" width="300">
</p>


## Using AUR
Install your dependencies:
```
sudo pacman -Syu nasm dosbox neovim wget unzip
```
Build and install from AUR with 
``` yay -S vimasm```

Test vimasm command:
 ```:Nc```
 and
 ```:Nd``` 


## Git
```
git clone git@github.com:sanecodeguy/vimasm.git   
chmod +x install.sh
./install.sh

.Open any .asm file in Neovim and use:

    :Nc to compile and run

    :Nd to compile and debug with AFD
```
## Requirements

    Neovim
    NASM (assembler)
    DOSBox (DOS emulator)
    wget, unzip
    AFD

## Installation Details

The installer:

    Checks for root privileges (don't run as root)
    Installs required packages via pacman
    Downloads AFD debugger to /usr/local/vimasm/dos/
    Creates DOSBox configuration at ~/.dosbox/dosbox-vimasm.conf
    Sets up Neovim plugin in ~/.config/nvim/lua/vimasm/init.lua
    Creates demo file at ~/vimasm_demo/welcome.asm

### File Structure

```
/usr/local/vimasm/
└── dos/
    └── AFD.EXE                 # Assembly debugger

~/.config/nvim/
└── lua/
    └── vimasm/
        └── init.lua            # Neovim plugin

~/.dosbox/
└── dosbox-vimasm.conf          # DOSBox configuration

~/vimasm_demo/
└── welcome.asm                 # Example assembly program
```

## Example
```
Try the included demo:
bash

nvim ~/vimasm_demo/welcome.asm
:Nc
```
## Troubleshooting
```
    Permission denied: Don't run installer as root
    Missing packages: Ensure pacman has internet access
    DOSBox errors: Check ~/.dosbox/dosbox-vimasm.conf exists
```
## Uninstall
```
Remove the installed files:

sudo rm -rf /usr/local/vimasm
rm -rf ~/.config/nvim/lua/vimasm
rm -f ~/.dosbox/dosbox-vimasm.conf
rm -rf ~/vimasm_demo
```
## Credits

Created by Syed Ali Rizvi

## License

**MIT License - feel free to modify and distribute.**



