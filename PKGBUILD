# Maintainer: Brendan MacDonell <brendan AT macdonell.net>
pkgname=apache-ant-contrib
pkgver=1.0b3
pkgrel=5
pkgdesc="Extra task definitions for apache ant."
arch=('any')
url="http://ant-contrib.sourceforge.net"
license=('apache')
depends=('apache-ant')
source=("https://repo1.maven.org/maven2/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3.jar")
md5sums=('a6495d687a143cbaefa2ab812c69b42e')

package() {
    install -m 755 -d "${pkgdir}/usr/share/java/apache-ant/"
    install -m 444 "${srcdir}/ant-contrib-1.0b3.jar" "${pkgdir}/usr/share/java/apache-ant/"
}
