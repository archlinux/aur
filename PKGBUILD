# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=maven-docs
pkgver=3.8.7
pkgrel=1
pkgdesc="Apache Maven Documentations."
arch=('any')
url="https://maven.apache.org"
license=('Apache')
options=('docs')
source=("${pkgname}-${pkgver}.jar::https://maven.apache.org/maven-site-1.0-site.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('baa117cbd9f57e70e853b44a597780539a5c878f0f2ec759a75280cb8cecd48c')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
	bsdtar -xf "${pkgname}-${pkgver}.jar" -C "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
}
# vim:set ts=4 sw=4 et:
