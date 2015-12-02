# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rq
pkgver=1.0.1
pkgrel=1
pkgdesc='Read plain-text files in blazing speed'
arch=('i686' 'x86_64')
url='https://github.com/maandree/rq'
license=('MIT')
depends=()
makedepends=('texinfo')
install=rq.install
source=(https://github.com/maandree/rq/archive/$pkgver.tar.gz)
sha256sums=(5699dd6595da4de6b05378f8990fc6c1eddf736e58290ff35692f661da357d48)


build() {
  cd "$srcdir/rq-$pkgver"
  make
}

package() {
  cd "$srcdir/rq-$pkgver"
  make DESTDIR="$pkgdir" install
}

