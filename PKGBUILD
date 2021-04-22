# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=docbook-xsl-saxon
pkgver=1.00
pkgrel=3
pkgdesc="Java extensions for use with the DocBook XML stylesheets and the Saxon XSLT engine"
arch=('any')
url="http://docbook.sourceforge.net/"
license=('custom:MIT')
depends=('java-runtime' 'docbook-xsl' 'saxon-he')
source=("https://sourceforge.net/projects/docbook/files/docbook-xsl-saxon/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d817580c0ab75e9b56cb2412b1a8ccbc')
sha1sums=('cb2069bcfd81cfa272ef14d97de7ec2cc099ffe4')
sha256sums=('0677751c97178594d24d07a4c8a230ab54f18c4d452aea9a66839995d4d9a7e8')
sha512sums=('e3920b23cd760ee7c24b7ee1af9d360c9d8ec4cc233cc122789fc5cf82b99a058da4f5786e5f9863d6dcf0403d77a6b91e0f07f33630d7e0fc31aeb16b4d2fda')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "saxon65.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
