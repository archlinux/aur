# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=apache-docs
pkgver=2.4.18
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('b973d7e8ed89bb056b65662ce4aa4fa3a6e7607a3e23bd65d8ad795c165ffac9')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
