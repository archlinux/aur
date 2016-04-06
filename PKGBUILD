# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=zerodb-server
pkgver=0.1.1
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol server"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
depends=("python-click")
source=("zerodb-server-${pkgver}.tar.gz::https://github.com/zero-db/zerodb-server/archive/0.1.1.tar.gz")
md5sums=('69c97a637d9ecb8d5ec8c8dc6dddf8bd')
 
package() {
    cd "${srcdir}/zerodb-server-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
