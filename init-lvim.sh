#!/bin/bash
mkdir -p ~/.config/lvim
cp /usr/share/doc/lunarvim/config.example.lua ~/.config/lvim/config.lua
mkdir -p ~/.local/share/lunarvim
ln -s /usr/share/lunarvim ~/.local/share/lunarvim/lvim

echo -e "\033[1;32m==> Installing dependencies of NodeJS & Rust...\033[0m"
yarn global add neovim
yarn global add tree-sitter-cli
cargo install fd-find
cargo install ripgrep

echo -e "\033[1;32m==> Preparing Lazy setup...\033[0m"
lvim --headless -c 'quitall'

[ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
  && cp /usr/share/doc/lunarvim/config.example.lua ~/.config/lvim/config.lua

echo -e "\033[1;32m==> Installing treesitter parsers..\033[0m"
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser/* \
  ~/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter/parser/
ln -s /usr/share/lunarvim/prebuild/nvim-treesitter/parser-info/* \
  ~/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter/parser-info/

echo -e "\033[1;32m==> Generate the new ftplugin template files..\033[0m"
lvim --headless +LvimUpdate +q

echo -e "\033[1;32m===============================================\033[0m"
echo "lunarvim runtime is inited for $(whoami)"
echo "clean up by:"
echo "    rm -rf ~/.config/lvim ~/.local/share/lunarvim"
echo -e "\033[1;32m===============================================\033[0m"
