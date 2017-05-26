# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-asyncssh
pkgver=1.10.1
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

sha256sums=('410f0724d52a0f509a81d7935a9eefc48d6b0873ac4fbe6048f4d262ecce856a')
