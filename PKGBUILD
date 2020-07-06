# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=1.9
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aa14330c09716b2348d9a906846ec0ca838bee2959ac4a4c664565e0c7f4e35a')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
