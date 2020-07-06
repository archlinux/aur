# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=2.0.1
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b4914301a88459c6ee008b8426fdf8986f13df13f3d80b652054680dd5d018f0')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
