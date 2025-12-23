# Maintainer: Peter Sutton <peter@foxdogstudios.com>

pkgname=postgresql-unit
pkgver=7.10
pkgrel=1
pkgdesc='SI Units for PostgreSQL'
arch=('x86_64')
url='https://github.com/ChristophBerg/postgresql-unit'
license=('GPL3')
depends=('postgresql')
source=('https://github.com/df7cb/postgresql-unit/archive/refs/tags/7.10.tar.gz')
sha256sums=('95bd28deba70bd7d5a28ddceb28fa8dcabbb0821851e8ef62207459d780a2d70')

build() {
  cd "$pkgname"-"$pkgver"
  make
}

package() {
  cd "$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir" install
}
