# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-snuggs
_module='snuggs'
pkgver=1.4.6
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

sha256sums=('8b87e5754fd2d0d1295b70bd502419f6f82be98c4bf668552da9d7c5f4387d1f')
