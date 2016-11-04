# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=jdom
pkgver=2.0.6
pkgrel=1
pkgdesc="Easy-to-use Java XML parser"
arch=('any')
url="http://www.jdom.org/downloads/"
license=('custom')
depends=('java-runtime')
provides=('jdom' 'jdom2')
source=("http://www.jdom.org/dist/binary/jdom-${pkgver}.zip")

md5sums=("5869015f58961bb38308f91b97c93d4d")

package() {
    install -D -m755 \
	"${srcdir}/jdom-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/jdom-${pkgver}.jar"
    install -D -m644 LICENSE.txt \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/java/${pkgname}/jdom-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/jdom.jar"
}
