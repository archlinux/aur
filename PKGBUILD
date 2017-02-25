# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=apache-docs
pkgver=2.4.25
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server.'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('d372d9830f855e062677c5365c189ef0b2a2eb5b7f0502f3ba4aec8ebe2020ab')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
