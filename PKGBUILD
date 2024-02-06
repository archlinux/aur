# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=maven-docs
pkgver=3.9.6
pkgrel=1
pkgdesc="Apache Maven Documentations."
arch=('any')
url="https://maven.apache.org"
license=('Apache')
options=('docs')
source=("${pkgname}-${pkgver}.jar::https://maven.apache.org/maven-site-1.0-site.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('395661cdf5f5fd34625d1186c069bf2a9e01ec596b80fa0a529a58cf23df6303')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
	bsdtar -xf "${pkgname}-${pkgver}.jar" -C "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
}
# vim:set ts=4 sw=4 et:
