# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-scripts-parachute
pkgver=0.6.0
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url='https://github.com/tcorreabr/Parachute'
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/v${pkgver}.zip")
sha256sums=('c4a7ff6a742025d77d4066e6f474ce49b3d9eb0040478b57afbc46b99116776f')

package() {
  cd $srcdir/Parachute-${pkgver}/
  kpackagetool5 --type Kwin/Script --install . -p "$pkgdir/usr/share/kwin/scripts/"
}
