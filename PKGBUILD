# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.1
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('1c50d513172088cbac82e0fc26d1e98bf71223213ada9c8509d7a04d1c43d90d')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
