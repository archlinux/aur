# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=vim-seti
pkgver=1.0
pkgrel=1
pkgdesc="Colorscheme based on Jesse Weed's Seti theme for the Atom editor"
arch=('any')
url='https://github.com/trusktr/seti.vim'
license=('custom:unknown')
depends=('vim')
source=('seti.vim::https://raw.githubusercontent.com/trusktr/seti.vim/1825cc5000defac0e57f518e64fc50b79db02c1b/colors/seti.vim')
md5sums=('ebf431562f010abcef9773bfe22c946f')

package() {
  install -Dm644 seti.vim "$pkgdir/usr/share/vim/vimfiles/colors/seti.vim"
}

# getver: -u 2
# vim:set ts=2 sw=2 et:
