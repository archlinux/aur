# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=3.2
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip4' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e6bc3b1537fbf891382537849e1e238abae5ca1446e5090f9e1cfee5da4b428')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
