# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=json-simple
pkgver=4.0.0
pkgrel=1
pkgdesc="JSON.simple - Simple, fast, extensible JSON encoder/decoder for Java"
arch=("any")
url="https://cliftonlabs.github.io/json-simple/"
license=('APACHE')
depends=('java-runtime')
source=("https://cliftonlabs.github.io/json-simple/target/${pkgname}-${pkgver}.jar")
sha256sums=('e8001c79a89dae597ec3e5cce480a81c7ff3773d6f62a7861288e90c67eb361c')

package() {
    install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
    install -m755 \
	"${srcdir}/${pkgname}-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/"
    ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

