# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=vim-wolfram
pkgdesc="Syntax Highlighting for Wolfram Language in Vim"
pkgver=0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/arnoudbuzing/wolfram-vim"
license=('None')
depends=()
optdepends=()
makedepends=('git')
source=('git+https://github.com/arnoudbuzing/wolfram-vim.git')
_gitname="wolfram-vim"
sha256sums=('SKIP')

# To activate set in "~/.vim/filetype.vim":
#     autocmd BufRead,BufNewFile *.wl     setfiletype wolfram
#     autocmd BufRead,BufNewFile *.wls    setfiletype wolfram
#     autocmd BufRead,BufNewFile *.m      setfiletype wolfram

package() {
  cd "${_gitname}"
  install -Dm644 syntax/wl.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/wolfram.vim
}
