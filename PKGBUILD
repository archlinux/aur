# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.2
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('336f6badbfec1689d94f6128c02c7c72d27956d8e27aa3979990000698723570')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
