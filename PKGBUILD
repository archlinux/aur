# Maintainer: Pedro Martinez-Julia <pedromj@gmail.com>

pkgname=simpy
pkgver=3.0.8
pkgrel=2
pkgdesc="Event discrete, process based simulation for Python."
url="https://simpy.rtfd.org"
depends=('python' )
makedepends=('python3' 'python-setuptools' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/simpy/simpy-${pkgver}.tar.gz")
sha256sums=('e127921510773f7b6189ab3596362809a37b87b7c2ae298b29ba3a6cca03e677')

build() {
    cd $srcdir/simpy-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/simpy-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
