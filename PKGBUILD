# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkgname=irc3
pkgver=0.8.9
pkgrel=1
pkgdesc="plugable irc client library based on asyncio"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python' 'python-venusian')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/i/irc3/irc3-$pkgver.tar.gz")
md5sums=('3e00be13ce5270ebe378f874ad659601')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1
}
