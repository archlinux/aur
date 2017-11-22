# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=tty-solitaire
pkgver=1.1.0
pkgrel=1
pkgdesc='ncurses-based klondike solitaire game'
arch=('x86_64')
url=https://github.com/mpereira/tty-solitaire
license=('MIT')
depends=('ncurses')
source=("tty-solitaire-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ecd4044bb75a3faf15b149fafc7ccdc60bc073897d1de5f1739f2ecef682cd9428cb3cdfca341583038ffe619d7638397584baa8bbee0c253adbd736ee9ff218')

build() {
  cd tty-solitaire-$pkgver
  make
}
package() {
  cd tty-solitaire-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
