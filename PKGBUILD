# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai
pkgver=1.0.1
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/$pkgname"
license=('GPL3')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.zip")
sha256sums=('40de7d4560e36dc2ab8ca3457b4b1a40350f6c8bea86c13fbe39a912cdba0e2e')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
