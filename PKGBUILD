# Maintainer:  Devorlon <root[at]devorlon[dot]xyz>

pkgname=brightness
pkgver=2.0
pkgrel=1
pkgdesc="Adjust monitor brightness using ddcutil"
arch=('any')
license=('GPL')
depends=('ddcutil' 'parallel')
source=('brightness')
md5sums=('SKIP')

package() {
  # Install script to /usr/bin
  install -Dm755 "$srcdir/brightness" "$pkgdir/usr/bin/brightness"
}
