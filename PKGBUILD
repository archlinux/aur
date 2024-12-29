# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=3.4
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python-lxml' 'python-pyqt5' 'python-urllib3')
makedepends=('python-setuptools' 'qt5-tools')
optdepends=('qt5-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('44980c54c4fd746b487192e621b84ec278db22fdea534646535f49535dc1937a815d79ede3870e49f14c95c051c73c90f4e1cdd25099ebf311bc3ecb540d727c')

package() {
    cd $pkgname-$pkgver
    python setup.py install --root $pkgdir
}

