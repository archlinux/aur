# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.4.1
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")

build() {
    cd "$srcdir/asyncssh-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/asyncssh-$pkgver"
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('46aafdf4cc77902edfb9bfa31b319512a986c09638d7dddd78e98a0912a9ae2b')
