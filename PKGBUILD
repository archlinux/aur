# Author: Dmitriy Smirnov <other@igus.lv>
pkgname=downgrader
pkgver=1.8.0
pkgrel=3
pkgdesc="Powerful packages downgrader for Archlinux. Works with libalpm, ARM and pacman logs"
arch=('i686' 'x86_64')
license=("GPL")

url="https://github.com/DimaSmirnov/Archlinux-downgrader"
source=($pkgname-$pkgver::"http://www.igus.lv/downgrader/downgrader.tar.xz")
optdepends=('sudo: for installation via sudo')
  
# install=$pkgname.install

build() {
  cd "$srcdir"
 make
}

package() {
  cd "$srcdir"
  install -D -m755 downgrader "$pkgdir/usr/bin/downgrader"
}
