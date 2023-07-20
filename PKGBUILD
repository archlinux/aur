# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst5-browser
pkgver=0.1.0
pkgrel=1
pkgdesc="Catalyst5 Web Browser"
arch=('x86_64')
url="https://getcatalyst.eu.org"
depends=("python-pyqt6" "python-pyqt6-sip" "python-pyqt6-webengine")
license=('MIT')
source=("https://github.com/CatalystDevOrg/Catalyst5/archive/refs/tags/v${pkgver}.zip")
md5sums=("SKIP")

package() {
  mkdir -p $pkgdir/opt/
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  cp -r $srcdir/Catalyst5-${pkgver}/Catalyst.desktop $pkgdir/usr/share/applications/catalyst5.desktop
  cp -r $srcdir/Catalyst5-${pkgver}/src/main.py $pkgdir/usr/bin/catalyst5
  chmod +x $pkgdir/usr/bin/catalyst5
  cp -r $srcdir/Catalyst5-${pkgver}/icon.png $pkgdir/opt/catalyst.png
}