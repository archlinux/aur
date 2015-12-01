# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pp
pkgver=1.0
pkgrel=1
pkgdesc='Page pager'
arch=('i686' 'x86_64')
url='https://github.com/maandree/pp'
license=('MIT')
depends=()
makedepends=('texinfo' 'auto-auto-complete')
install=pp.install
source=(https://github.com/maandree/pp/archive/$pkgver.tar.gz)
sha256sums=(458ce1a97f07c58c39547b8504fa97e60b2f1c5c3489e84c641e5a84a24fac05)


build() {
  cd "$srcdir/pp-$pkgver"
  make
}

package() {
  cd "$srcdir/pp-$pkgver"
  make DESTDIR="$pkgdir" install
}

