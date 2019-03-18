# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.9
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('17f5e0b87e12ad476282d65625e19cff92adcf0b8a12fa368c3b32099103078a')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
