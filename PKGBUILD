# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=python-txzmq
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://pypi.org/project/txZMQ"
license=("MPL2")
pkgdesc="Twisted bindings for ZeroMQ"
depends=('python-twisted' 'python-pyzmq')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/txZMQ/txZMQ-${pkgver}.tar.gz")
sha256sums=('8d607d0bf09ca94600b8e42f0721dbe43ee53a0470182344ac7ace7e58dc6177')

build() {
    cd txZMQ-$pkgver
    python setup.py build
}

package() {
    cd txZMQ-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}