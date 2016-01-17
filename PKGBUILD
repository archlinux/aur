# $Id$
# Maintainer: Brayden.Dean <braydenjdean@gmail.com>

pkgname=chromium-dev-incognito
pkgver=1
pkgrel=1
pkgdesc="Provide a start script to start chromium-dev in incognito mode"
url="https://www.chromium.org/"
arch=('any')
license=('BSD')
depends=('chromium-dev')
source=($pkgname)
md5sums=('88f0169dcb1155338e680bb25bc603e6')

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 $pkgname "$pkgdir/usr/bin/"
}
