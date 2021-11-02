# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=2.4
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5dcabd5671201247ae32168438d40f9e6f091be3cbbc74c5f9ad70e57894aee0')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
