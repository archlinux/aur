# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>

pkgname=mariadb-jdbc
pkgver=1.1.8
pkgrel=1
pkgdesc="The official JDBC driver (Java library) for MariaDB"
arch=('any')
url="https://downloads.mariadb.org/client-java/"
license=('LGPL2.1')
depends=('java-runtime')
provides=('mysql-jdbc')
conflicts=('mysql-jdbc')
replaces=('mysql-jdbc')
source=("http://ftp.osuosl.org/pub/mariadb/client-java-${pkgver}/mariadb-java-client-${pkgver}.jar")
md5sums=("f73ea6447640d3712555376bbd80fff9")

package() {
    install -D -m755 \
	${srcdir}/mariadb-java-client-${pkgver}.jar \
	${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client-$pkgver.jar
    ln -s /usr/share/java/${pkgname}/mariadb-java-client-${pkgver}.jar \
	${pkgdir}/usr/share/java/${pkgname}/mariadb-java-client.jar
}
