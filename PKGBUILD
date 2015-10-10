# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

pkgname=chromium-incognito
pkgver=1
pkgrel=1
pkgdesc="Provide a start script to start chromium in incognito mode"
url="https://www.chromium.org/"
arch=('any')
license=('BSD')
depends=('chromium')
source=($pkgname)
md5sums=('b5b90a8ffe62fab2ca2fd9e7d0588e26')

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 $pkgname "$pkgdir/usr/bin/"
}
