# Maintainer: Martin Patz <mailto at martin-patz.de>

pkgname=indicator-sound-switcher-git
pkgver=2.3.5.2
pkgrel=1
pkgdesc="Sound input/output selector indicator for Linux."
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/yktoo/indicator-sound-switcher"
depends=('python')
source=(https://github.com/yktoo/indicator-sound-switcher/archive/v${pkgver}.tar.gz)
md5sums=('49c836b5d20c505a32971f4fbd2182af')

package() {
    cd indicator-sound-switcher-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
