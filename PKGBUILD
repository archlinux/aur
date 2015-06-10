# Maintainer: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
pkgname=mysql-connector-java
pkgver=5.1.35
pkgrel=1
pkgdesc="Java library to connect to MySQL"
arch=(any)
license=(GPL)
url="http://www.mysql.com/downloads/connector/j/"
source="http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz"
provides=('mysql-connector-java')
md5sums=('e59c9438a9c6c07e27252ad3156123ca')

package() {
	cd $srcdir
	install -D -m644 $srcdir/mysql-connector-java-${pkgver}/mysql-connector-java-${pkgver}-bin.jar $pkgdir/usr/share/java/mysql-connector-java-${pkgver}-bin.jar

	# Install symlink for not requiring a specific version
	ln -sf /usr/share/java/mysql-connector-java-${pkgver}-bin.jar ${pkgdir}/usr/share/java/mysql-connector-java-bin.jar
}
