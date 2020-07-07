# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=vim-seti
pkgver=1.0
pkgrel=4
pkgdesc="Colorscheme based on Jesse Weed's Seti theme for the Atom editor"
arch=('any')
url='https://github.com/trusktr/seti.vim'
license=('custom:unknown')
groups=('vim-plugins')
depends=('vim')
source=('seti.vim::https://raw.githubusercontent.com/trusktr/seti.vim/1825cc5000defac0e57f518e64fc50b79db02c1b/colors/seti.vim')
sha256sums=('fe956cf6fbcf0a0fb7f870c3cb52b2d28da1932815da5c5fa3832d26dfaebe31')

package() {
  install -Dm644 seti.vim "$pkgdir/usr/share/vim/vimfiles/colors/seti.vim"
}

# getver: roboticoverlords.org/noversion/
# vim:set ts=2 sw=2 et:
