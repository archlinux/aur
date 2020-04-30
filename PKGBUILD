# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sockjs
pkgver='0.10.0'
pkgrel=1
pkgdesc="SockJS server implementation for aiohttp."
url="https://github.com/aio-libs/sockjs/"
depends=('python')
makedepends=('python-setuptools' 'git')
license=('Apache')
arch=('any')
source=("git+https://github.com/aio-libs/sockjs#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sockjs"
    python setup.py build
}

package() {
    cd "$srcdir/sockjs"
    python setup.py install --root="${pkgdir}" --optimize=1
}
