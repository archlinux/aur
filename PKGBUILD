# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.8.4
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=('https://github.com/dglent/meteo-qt/archive/v0.8.4.tar.gz')
sha256sums=('f048db5629d5363594702574c8de5a1b9002f728c5917eb5eedf92f749a2b495')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
