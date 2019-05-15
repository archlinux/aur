# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-snuggs
_module='snuggs'
pkgver=1.4.5
pkgrel=1
pkgdesc="Snuggs are s-expressions for Numpy"
url="https://github.com/mapbox/snuggs"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/s/$_module/$_module-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('a315f8fc2d781225ffee92081c7e20217ba178e9b192ffd26b85a0013c056d2c')
