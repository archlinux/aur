# Maintainer: Pasha <portalpasha300@gmail.com>
pkgname=loadcert
pkgver=0.0.3
pkgrel=3
pkgdesc="Loads certificate into the system"
arch=('any')
license=('custom')
depends=()
url=""
source=("$pkgname")
sha256sums=('cb117bd0b1fc80b9e49d17925edf18ce25eb7d3611478b9b4357e0cef3bb97d0')
package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
