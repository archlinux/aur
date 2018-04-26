# Maintainer: deusstultus <0x574EDC8EE28E6872A2D9CC66939C852925E4A9F0>

pkgname=simploripsum
pkgver=0.3
pkgrel=4
pkgdesc="A simple cli interface for loripsum.net lorem ipsum API"
arch=('any')
url="https://github.com/deusstultus/simploripsum"
license=('GPL')
depends=('bash')

source=("git+git://github.com/deusstultus/simploripsum.git#tag=$pkgver")
sha256sums=('SKIP')
validpgpkeys=('0x574EDC8EE28E6872A2D9CC66939C852925E4A9F0')

package() {
  install -D -m755 "$srcdir/$pkgname/simploripsum.sh" "$pkgdir/usr/bin/simploripsum"
}

# vim:set sw=2 ts=2 et:

