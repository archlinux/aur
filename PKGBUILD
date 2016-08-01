# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=zerodb-server
pkgver=0.2.0a1
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol server"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
depends=("python-click")
source=("https://pypi.python.org/packages/9e/76/b2729990f4117d907c33ca254317cf7c8015ff79adce3d19c002fe64993a/zerodb-server-0.2.0a1.tar.gz")
md5sums=('e5c607a1ebc3851c3c0623b0319d7f7e')
 
package() {
    cd "${srcdir}/zerodb-server-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
