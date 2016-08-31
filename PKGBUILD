# Maintainer: ShadowKyogre <shadowkyogre dot public at gmail dot com>

_hash_id="15/7d/0a6ec4478d2949e24a127525df477251d256a31661751c2605d1e2e25c2a"
pkgname=slickpicker
pkgver=0.2
pkgrel=1
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/ShadowKyogre/slickpicker/"
license=('GPL')
depends=('python-pyqt5')
source=("https://pypi.python.org/packages/${_hash_id}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" 
}
md5sums=('dacc7a4f16e1f7981d19d53bdea36dc7')
