# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-scripts-parachute
pkgver=0.5
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url='https://github.com/tcorreabr/Parachute'
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/cfc9d5757bbe16d61e166d0931a9928630d22a37.zip")
sha256sums=('1cb3204703c145178f14e742c6e955d1a4d394ad3b3b167131c9f90d74b06017')

package() {
  cd $srcdir/Parachute-cfc9d5757bbe16d61e166d0931a9928630d22a37/
  kpackagetool5 --type Kwin/Script --install . -p "$pkgdir/usr/share/kwin/scripts/"
}
