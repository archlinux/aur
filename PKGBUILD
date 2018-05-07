# Maintainer: Pedro Martinez-Julia <pedromj@gmail.com>

pkgname=simpy
pkgver=3.0.10
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="https://simpy.rtfd.org"
depends=('python' )
makedepends=('python3' 'python-setuptools' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/simpy/simpy-${pkgver}.tar.gz")
sha256sums=('0d8a79de3dc8b83102dc51090a6bf10d3e3a2944f0cf294fe72ed998f2a0aca1')

build() {
    cd $srcdir/simpy-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/simpy-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
