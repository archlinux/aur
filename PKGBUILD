# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=apache-docs
pkgver=2.4.20
pkgrel=1
pkgdesc='Set of HTML documentation for Apache HTTP Server'
arch=('any')
url='https://httpd.apache.org/docs/'
license=('APACHE')
options=('docs')
source=(http://www.apache.org/dist/httpd/docs/httpd-docs-${pkgver}.en.zip)
sha256sums=('78b3b242cadc808b2e60b5e873af7e4467170bd44a6624a4fde1871a177289d9')

package() {
  install -d ${pkgdir}/usr/share/doc/httpd
	cp -a ${srcdir}/httpd-docs-${pkgver}.en/* \
    ${pkgdir}/usr/share/doc/httpd/
}
