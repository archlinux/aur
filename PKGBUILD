# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=maven-docs
pkgver=3.9.2
pkgrel=1
pkgdesc="Apache Maven Documentations."
arch=('any')
url="https://maven.apache.org"
license=('Apache')
options=('docs')
source=("${pkgname}-${pkgver}.jar::https://maven.apache.org/maven-site-1.0-site.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('8227f4a759db77e44f710d1a652562cd82702c15e64f29f292181c3a8f7a6079')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
	bsdtar -xf "${pkgname}-${pkgver}.jar" -C "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
}
# vim:set ts=4 sw=4 et:
