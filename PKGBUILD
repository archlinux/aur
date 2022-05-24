# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=fastjson
pkgver=1.2.83
pkgrel=1
pkgdesc="A fast JSON parser/generator for Java"
arch=('i686' 'x86_64')
url="https://github.com/alibaba/fastjson"
license=('APACHE')
depends=('java-runtime')
source=("https://repo1.maven.org/maven2/com/alibaba/fastjson/$pkgver/fastjson-$pkgver.jar")
sha256sums=('641a4d65ab32fbfdccd9c718e3f83ebc4caabdb5e4fe5b3d51527c5fe692631d')

package() {
    install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
    install -m755 \
	"${srcdir}/${pkgname}-${pkgver}.jar" \
	"${pkgdir}/usr/share/java/${pkgname}/"
    ln -s "/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

