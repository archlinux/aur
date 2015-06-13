# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=pure-csv
pkgver=1.6
pkgrel=1
pkgdesc="A Pure module for reading and writing Comma Separated Value (CSV) files"
arch=("i686" "x86_64")
license=('custom')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-web)

source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('147b736cc81be1d68221104ba16cd276947d9e5b')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
