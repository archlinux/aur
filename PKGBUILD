# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=colourpipe
pkgver=1.0.2
pkgrel=1
pkgdesc="Collection of programs used to colour the output of other programs"
arch=('any')
url="https://github.com/maandree/colourpipe"
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment')
provides=('colourpipe')
conflicts=('colourpipe')
source=($url/archive/$pkgver.tar.gz)
md5sums=(8d78f49847625fe0f1b11c996c2d824b)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  MAKEFLAGS= make DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  MAKEFLAGS= make DESTDIR="$pkgdir/" install
}
