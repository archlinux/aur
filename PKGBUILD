# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=wapiti
pkgver=2.3.0
pkgrel=2
pkgdesc="A vulnerability scanner for web applications. It currently search vulnerabilities like XSS, SQL and XPath injections, file inclusions, command execution, LDAP injections, CRLF injections..."
url='http://wapiti.sourceforge.net/'
license=(GPL)
depends=(python2 python2-setuptools python2-requests python2-beautifulsoup3)
arch=(any)

source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}/${pkgname}-${pkgver}/$pkgname-$pkgver.tar.gz)
md5sums=('dd8b0ab120518215abf9c7b22251fd8b')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
