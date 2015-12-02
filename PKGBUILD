# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pp
pkgver=1.0.1
pkgrel=1
pkgdesc='Page pager'
arch=('i686' 'x86_64')
url='https://github.com/maandree/pp'
license=('MIT')
depends=()
makedepends=('texinfo' 'auto-auto-complete')
install=pp.install
source=(https://github.com/maandree/pp/archive/$pkgver.tar.gz)
sha256sums=(cc56692bee9603cfb482e92ec5d76a9b794b138624ae09095c5b9ab129b7d8c3)


build() {
  cd "$srcdir/pp-$pkgver"
  make
}

package() {
  cd "$srcdir/pp-$pkgver"
  make DESTDIR="$pkgdir" install
}

