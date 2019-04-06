# Maintainer: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=5.0.0
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python')
source=("https://pypi.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('4ec22817297b7024f89721cc34f790ee2767c5b5ca44284c565ee643abafbe32')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
