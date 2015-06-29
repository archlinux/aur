# Maintainer: sumito3478 <sumito3478@gmail.com>

pkgname=python-tinkerer
pkgver=1.5
pkgrel=1
pkgdesc="Sphinx-based blogging engine"
url="http://tinkerer.me/"
depends=('python' 'python-babel' 'python-sphinx' 'python-jinja' 'python-pyquery')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/T/Tinkerer/Tinkerer-$pkgver.zip")
md5sums=('4424d70a262b1848c9a8553723ad159f')

build() {
    cd "$srcdir/Tinkerer-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/Tinkerer-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
