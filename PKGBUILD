# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=3.3
pkgrel=2
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python-lxml' 'python-pyqt5' 'python-urllib3')
makedepends=('python-setuptools' 'qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('823647bcc7a6de9379c9608d30c5231257d66fe172e9d96bf3962900dc8e8af5')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
