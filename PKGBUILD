# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=fastjson
pkgver=1.2.72
pkgrel=1
pkgdesc="A fast JSON parser/generator for Java"
arch=('i686' 'x86_64')
url="https://github.com/alibaba/fastjson"
license=('APACHE')
depends=('java-runtime')
source=("https://repo1.maven.org/maven2/com/alibaba/fastjson/$pkgver/fastjson-$pkgver.jar")
sha256sums=('f8198bd972839cbc890b239e438531d1580870cd978ec17b743b563c41f2e970')

package() {
    install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
    install -m755 \
	"${srcdir}/${pkgname}-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/"
    ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

