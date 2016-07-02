# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=zerodb-server
pkgver=0.1.23
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol server"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
depends=("python-click")
source=("https://pypi.python.org/packages/1a/05/2b4dcf7114e4cddfade9e01ab1d338e2202a075bf92350efcc687cd531b0/zerodb-server-0.1.23.tar.gz")
md5sums=('430b6693eef9dd034f921af371bbfaa3')
 
package() {
    cd "${srcdir}/zerodb-server-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
