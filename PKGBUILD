# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=emptty-runit
pkgdesc="Runit init script for emptty"
pkgver=0.6.2
pkgrel=1
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('489003c567bcbe1c704a349aff516c4179a9a8ca5a3dc70b1a86772d8bf60baffd3fe85dd5423ade29b48cd0240bd47f4fec244c3a1b6aeaacef5d6f4f67aa5e')

package() {
  cd "emptty-$pkgver"
  make DESTDIR="$pkgdir/" install-runit-artix
}
