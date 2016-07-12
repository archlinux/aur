# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=zerodb-server
pkgver=0.1.24
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol server"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
depends=("python-click")
source=("https://pypi.python.org/packages/28/38/597cb9cd16c0867f20a64ffcfe43353a6162bfc598bcf5687a17b6102cdb/zerodb-server-0.1.24.tar.gz")
md5sums=('8684dfab20b7ecd54429443498d68317')
 
package() {
    cd "${srcdir}/zerodb-server-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
