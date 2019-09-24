# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-snuggs
_module='snuggs'
pkgver=1.4.7
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

sha256sums=('501cf113fe3892e14e2fee76da5cd0606b7e149c411c271898e6259ebde2617b')
