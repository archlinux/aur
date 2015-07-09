# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=apache-docs
pkgver=2.4.12
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('2d5c8500b717cc6c75039479172023c0cf59ce09a2144bb88ec62a604483c67e')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
