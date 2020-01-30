# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=1.3
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('f3c3cabe4c08c9e41162c352ebd32a39d0dc2be47acb0c015a362c4280347a56')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
