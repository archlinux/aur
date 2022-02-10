# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=jdom
pkgver=2.0.6.1
pkgrel=1
pkgdesc="Easy-to-use Java XML parser"
arch=('any')
url="http://www.jdom.org/downloads/"
license=('custom')
depends=('java-runtime')
provides=('jdom' 'jdom2')
source=("http://www.jdom.org/dist/binary/jdom-${pkgver}.zip")

sha256sums=("1c870864a9f92f71920d4429ed683225f9c85541fb49eaa99341c86baec5c42f")

package() {
    install -D -m755 \
	"${srcdir}/jdom-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/jdom-${pkgver}.jar"
    install -D -m644 LICENSE.txt \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/share/java/${pkgname}/jdom-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/jdom.jar"
}
