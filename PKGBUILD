# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python2-pyrabbit
pkgver=1.1.0
pkgrel=1
pkgdesc="A Pythonic interface to the RabbitMQ Management HTTP API"
url="http://www.github.com/bkjones/pyrabbit"
depends=('python2')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pyrabbit/pyrabbit-$pkgver.tar.gz")
md5sums=('625013ba47fe79d296b76a74200c3312')

build() {
    cd "$srcdir/pyrabbit-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyrabbit-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
