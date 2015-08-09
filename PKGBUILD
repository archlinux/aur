# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=dupmerge
pkgver=1.73
pkgrel=2
pkgdesc="Create hardlinks between duplicate files."
arch=('i686' 'x86_64')
url="http://dupmerge.sourceforge.net/"
license=('GPL')
makedepends=('unzip')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}_$pkgver.zip")
md5sums=('0c50ce2877be34ced391ec32b30324a6')

build() {
  cd "$srcdir/${pkgname}_$pkgver"
  gcc -o dupmerge dupmerge.c
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 dupmerge "$pkgdir/usr/bin/dupmerge"
}
# vim:syntax=sh
