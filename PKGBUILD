# Maintainer: Andrés Cordero <arch@andrew67.com>
pkgname=etherpuppet
pkgver=v0.4
pkgrel=3
pkgdesc="Small program that will create a voodoo doll for an Ethernet interface"
arch=('any')
url="http://www.secdev.org/projects/etherpuppet/"
license=('LGPL')
source=('https://raw.githubusercontent.com/secdev/etherpuppet/c1d5ca279e718e60c67a7bc62ed27b855a8bf1d9/etherpuppet.c')
noextract=()
md5sums=('755097760542e477ccd3ab0f6f20200c')

build() {
  cd "$srcdir"
  cc -o etherpuppet etherpuppet.c
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/etherpuppet" "$pkgdir/usr/bin"
}
