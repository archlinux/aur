# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python-pyee
pkgver=1.0.1
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jesusabdullah/pyee"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
md5sums=('d7583c0d788e7d332538429d01178390')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
