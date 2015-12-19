# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.8.8
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('db7716152b0bc056aeea276191096bf491fea0125dc420e2548749293bc1423f')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
