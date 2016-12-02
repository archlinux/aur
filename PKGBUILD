# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=apache-docs
pkgver=2.4.23
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server.'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('b3d545d4d790b4cf012c72116fe4fb3091ea9a972d47ff4ce5bea8bf76bc78c1')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
