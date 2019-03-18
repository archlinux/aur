# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.6
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('8e35a9956e76041bd0a1ec4d97f69ad7b69b7ca5f73e1fe03ba6190bce4202e9')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
