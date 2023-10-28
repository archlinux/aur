# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=maven-docs
pkgver=3.9.5
pkgrel=1
pkgdesc="Apache Maven Documentations."
arch=('any')
url="https://maven.apache.org"
license=('Apache')
options=('docs')
source=("${pkgname}-${pkgver}.jar::https://maven.apache.org/maven-site-1.0-site.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('5b6455e79ae4e0b5ff505f2369b95454de350cb2a8fed3d777982ff9d55f975a')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
	bsdtar -xf "${pkgname}-${pkgver}.jar" -C "${pkgdir}/usr/share/doc/${pkgname%-docs}/site"
}
# vim:set ts=4 sw=4 et:
