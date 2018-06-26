# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=wapiti
pkgver=3.0.1
pkgrel=1
pkgdesc="A vulnerability scanner for web applications. It currently search vulnerabilities like XSS, SQL and XPath injections, file inclusions, command execution, LDAP injections, CRLF injections..."
url='http://wapiti.sourceforge.net/'
license=(GPL)
depends=(python python-setuptools python-requests python-beautifulsoup4 python-lxml python-tld python-yaswfp python-mako python-pysocks)
arch=(any)

source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}${pkgver:0:1}-${pkgver}.tar.gz")
sha256sums=('bbb8c8f572afe77319734489a6ca0b211df4b87ad294db79b8bf0bda1c5aff29')

package() {
    cd "${srcdir}/${pkgname}${pkgver:0:1}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
