pkgname=python-packbits
pkgver=0.6
pkgrel=1
pkgdesc="This module implements a PackBits encoder/decoder for Python 2.x and 3.x."
url="https://github.com/kmike/packbits"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/packbits/packbits-$pkgver.tar.gz")
sha256sums=('bc6b370bb34e04ac8cfa835e06c0484380affc6d593adb8009dd6c0f7bfff034')

build() {
    cd "$srcdir/packbits-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/packbits-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
