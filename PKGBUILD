# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=wapiti
pkgver=3.0.0
pkgrel=2
pkgdesc="A vulnerability scanner for web applications. It currently search vulnerabilities like XSS, SQL and XPath injections, file inclusions, command execution, LDAP injections, CRLF injections..."
url='http://wapiti.sourceforge.net/'
license=(GPL)
depends=(python python-setuptools python-requests python-beautifulsoup4 python-lxml python-tld python-yaswfp python-mako python-pysocks)
arch=(any)

source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4238b336773b6cb1a36a5a2f2fa0bbe413a41e13fa6f5b109dbf6bbc897e4b46')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
