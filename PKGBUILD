# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.3
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('1a7ef9e5c61cf4b41fb2f2aef43f7ae33ef478d6b82c64e9733f23c8681ef902')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
