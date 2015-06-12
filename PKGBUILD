# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.3
pkgrel=1
pkgdesc='Passphrase strength evaluater'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'gzip' 'auto-auto-complete')
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(39d0f2e09fd145c25e1b069b08f501d46edc67fbe8fb9f2e90d5bb8d58a89dea)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install
}

