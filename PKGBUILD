# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-snuggs
_module='snuggs'
pkgver=1.4.3
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

sha256sums=('d819e52a6b104936b293b625e5ab53cb8b95194643525a7d181334d743a77625')
