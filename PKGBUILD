# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python-pyee
pkgver=0.0.9
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jesusabdullah/pyee"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
md5sums=('d72a257a2507ab2376746bfd75c402be')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
