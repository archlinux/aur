# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=0.8.7
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL3')
depends=('libxkbcommon-x11' 'python-lxml' 'python-pyqt5' 'python-sip' 'python-urllib3')
makedepends=('python' 'qt5-tools')
source=("https://github.com/dglent/meteo-qt/archive/v${pkgver}.tar.gz")
sha256sums=('bbc298e714ce7978f57afa08babb59c15268a1136ae4ddfe553fdb9e13fa4994')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir
}
