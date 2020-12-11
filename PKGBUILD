# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

_pypiname=aiomultiprocess
pkgname=python-aiomultiprocess
pkgver=0.8.0
pkgrel=1
pkgdesc="asyncio version of the standard multiprocessing module"
url="https://github.com/jreese/aiomultiprocess"
arch=(any)
license=(MIT)
makedepends=(python-setuptools)
source=("https://github.com/jreese/aiomultiprocess/archive/v${pkgver}.tar.gz")
sha256sums=('3ba56cb1bf588a526d43f14e063ce4fbe471b693c90c8ed903ff3f718202d87e')

build() {
    cd ${_pypiname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pypiname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
