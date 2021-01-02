# Maintainer: Francesco Mistri <franc.mistri at gmail dot com>
pkgname=cow
pkgver=1.0
pkgrel=0
pkgdesc="COW is a toy esoteric language. See the classic COW webpage for more info!"
arch=('i686' 'x86_64')
makedepends=(gcc)
source=("https://github.com/BigZaphod/COW/tarball/master")
md5sums=("f11450f30dea7cb2a3bc8b2d15196bcc")

build() {
  # cd $srcdir
  g++ $srcdir/BigZaphod-COW-37d6f76/source/cow.cpp -o cow
}

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/cow $pkgdir/usr/bin
}

