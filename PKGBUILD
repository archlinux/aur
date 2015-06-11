# Maintainer: Andrés Cordero <arch@andrew67.com>
pkgname=etherpuppet
pkgver=v0.3
pkgrel=1
pkgdesc="Small program that will create a voodoo doll for an Ethernet interface"
arch=('any')
url="http://www.secdev.org/projects/etherpuppet/"
license=('LGPL')
source=('http://bb.secdev.org/etherpuppet/raw/09b331139678d1f0bb8f13fece8b880962015591/etherpuppet.c')
noextract=()
md5sums=('d5e9350308fd4614d9bfc7fd7b00aa01')

build() {
  cd "$srcdir"
  cc -o etherpuppet etherpuppet.c
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/etherpuppet" "$pkgdir/usr/bin"
}
