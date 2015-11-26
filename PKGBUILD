# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=apache-docs
pkgver=2.4.17
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('e29c0278ff83d94a2013ecd0f39d358dce7d911e6f0134fa93b00ee212de69a3')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
