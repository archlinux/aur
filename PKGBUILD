# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=json-simple
pkgver=4.0.1
pkgrel=1
pkgdesc="JSON.simple - Simple, fast, extensible JSON encoder/decoder for Java"
arch=("any")
url="https://cliftonlabs.github.io/json-simple/"
license=('APACHE')
depends=('java-runtime')
source=("https://cliftonlabs.github.io/json-simple/target/${pkgname}-${pkgver}.jar")
sha256sums=('b5e0c5fe89d2893dcd618af7ad0504a888da0c1e06187fd0284b2a2fd1a8beae')

package() {
    install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
    install -m755 \
	"${srcdir}/${pkgname}-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/"
    ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

