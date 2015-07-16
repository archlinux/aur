# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=json-simple
pkgver=1.1.1
pkgrel=1
pkgdesc='JSON.simple - A simple Java toolkit for JSON.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/json-simple'
license=('APACHE')
depends=('java-runtime')
source=("http://json-simple.googlecode.com/files/${pkgname}-${pkgver}.jar")
sha1sums=('5d6f9b6a9ddca2a28c0216cc44efb2e20d9c23b5')

package() {
    install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
    install -m755 \
	"${srcdir}/${pkgname}-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/"
    ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

