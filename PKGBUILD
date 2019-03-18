# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.9.8
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('7dfd05b4e2f0472e7b7c7b3b2629272c51342b8e87269026ea66b4d0af70db30')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
