# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.2.1
pkgrel=1
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman"
license=('MIT')
depends=('instead')
makedepends=('go')
source=("https://github.com/jhekasoft/insteadman/archive/v$pkgver.tar.gz")
sha256sums=('e07c033275ddd241686b2fcca5eee95b409636d7ddff88c5111459b425a2c954')

build() {
  cd "$srcdir/insteadman-$pkgver"
  make
}

package() {
  cd "$srcdir/insteadman-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
