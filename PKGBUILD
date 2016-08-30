# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.6.1
pkgrel=1
pkgdesc="Asynchronous SSHv2 client and server library"
arch=(any)
url="http://asyncssh.readthedocs.org/"
license=('EPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/asyncssh/asyncssh-$pkgver.tar.gz")

build() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/asyncssh-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('eafa6cc5e431aaec60d9c3819cea117e3ba1ccf7464e80e9bb04b913caaf6415')
