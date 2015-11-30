# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.8.6
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=('https://github.com/dglent/meteo-qt/archive/v0.8.6.tar.gz')
sha256sums=('fccd4a5414dd8481ce6b567ed966d8e1150c2529f94f2fb6444e87417ff0b6aa')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
