# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkgname=irc3
pkgver=0.8.6
pkgrel=3
pkgdesc="plugable irc client library based on asyncio"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python' 'python-venusian')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/i/irc3/irc3-$pkgver.tar.gz")
md5sums=('6037ddeabed6ed0581a688683cb9b370')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1
}
