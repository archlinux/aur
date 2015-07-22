# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=mrunit
pkgver=1.0.0
_pkgverfull=1.0.0-hadoop2
pkgrel=1
pkgdesc="Apache MRUnit is a Java library that helps developers unit test Apache Hadoop map reduce jobs"
arch=('any')
url="http://mrunit.apache.org/"
license=('apache')
depends=('mockito')
source=(http://mirror.cc.columbia.edu/pub/software/apache/$pkgname/$pkgname-$pkgver/apache-$pkgname-$_pkgverfull-bin.tar.gz)
md5sums=('a942422d1677c12f0ed5444d08e6f023')

package() {
	cd "$srcdir/apache-$pkgname-$_pkgverfull"
        install -Dm644 ${srcdir}/apache-$pkgname-$_pkgverfull/lib/${pkgname}-${_pkgverfull}.jar ${pkgdir}/usr/share/java/${pkgname}.jar
}
