# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-snuggs
_module='snuggs'
pkgver=1.4.2
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

sha256sums=('8d56182fc83e1a1893284f69abd35751ce30e8f0a33794c2802e7e5d6547e1f1')
