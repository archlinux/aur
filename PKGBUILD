# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-scripts-parachute
pkgver=0.5.1
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url='https://github.com/tcorreabr/Parachute'
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/v${pkgver}.zip")
sha256sums=('fcdb239f6e1003984f5195eb7f0740d7501d0bb797bb78b0981978bf9da3b556')

package() {
  cd $srcdir/Parachute-${pkgver}/
  kpackagetool5 --type Kwin/Script --install . -p "$pkgdir/usr/share/kwin/scripts/"
}
