#!/bin/bash
install -D /usr/share/doc/candyvim/config.example.lua ~/.config/cvim/config.lua

mkdir -p ~/.local/share/candyvim
ln -s /usr/share/candyvim ~/.local/share/candyvim/cvim

git clone https://github.com/wbthomason/packer.nvim ~/.local/share/candyvim/site/pack/packer/start/packer.nvim

cvim --headless +"autocmd User PackerComplete quitall" +PackerSync &> /dev/null

echo -e "\033[1;34m====================CANDYVIM========================\033[0m"
echo "CandyVim installed for $(whoami)"
echo "clean up by:"
echo "    rm -rf ~/.config/cvim ~/.local/share/candyvim"
echo -e "\033[1;34m====================================================\033[0m"

