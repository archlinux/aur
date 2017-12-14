# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

_pkgname=seafobj
pkgname=python2-$_pkgname
pkgver=6.2.2
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
        "setup.py")
sha256sums=('c51d4f48bd5be64bf399b9c3ab3a592349917b73615344cf6ed2171b3a103c19'
            'ce6dcf2a525aa6fde928ad806259cbf0353a6754e8f7936f444d01a8e88f9978')

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python2 ../setup.py install --root="$pkgdir/" --optimize=1
}
