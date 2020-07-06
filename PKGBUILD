# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=1.7
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c7c4f81bdbbe402b6c72a277b9156f3f1c0cf0380733366bc6fcce1ce512d9a0')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
