# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Tim Diels <limyreth[at]gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vimpdb
pkgver='0.beta'
pkgrel=3
pkgdesc="A vim script for debugging python."
arch=(any)
url="http://code.google.com/p/vimpdb/"
license=('GPL3')
groups=()
depends=(vim-runtime python)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://vimpdb.googlecode.com/files/VimPdb.tar')
noextract=()

build() {
  cd ${srcdir}

  sed 's/\r//' -i VimPdb.vim VimPdb.py

  install  -Dm644 VimPdb.py \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.py
  install -Dm644 VimPdb.vim \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/VimPdb.vim
  install -Dm644 readme.txt \
    "$pkgdir"/usr/share/doc/vimpdb/readme.txt
}

md5sums=('ba777bb3f8f2dd991958f3011779c082')
