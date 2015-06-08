# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=docbook-xsl-saxon
pkgver=1.00
pkgrel=3
pkgdesc="Java extensions for use with the DocBook XML stylesheets and the Saxon XSLT engine"
arch=('any')
url="http://docbook.sourceforge.net/"
license=('custom:MIT')
depends=('java-runtime' 'docbook-xsl' 'saxon-he')
source=("http://sourceforge.net/projects/docbook/files/docbook-xsl-saxon/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d817580c0ab75e9b56cb2412b1a8ccbc')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "saxon65.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
