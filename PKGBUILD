# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rq
pkgver=1.0
pkgrel=1
pkgdesc='Read plain-text files in blazing speed'
arch=('i686' 'x86_64')
url='https://github.com/maandree/rq'
license=('MIT')
depends=()
makedepends=('texinfo')
install=rq.install
source=(https://github.com/maandree/rq/archive/$pkgver.tar.gz)
sha256sums=(3ed183d750197f79ffe88c359d1620504f8448349b6d308a76937537f2eec417)


build() {
  cd "$srcdir/rq-$pkgver"
  make
}

package() {
  cd "$srcdir/rq-$pkgver"
  make DESTDIR="$pkgdir" install
}

