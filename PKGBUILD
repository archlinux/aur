# Maintainer: M0Rf30

pkgname=apache-mime4j
pkgver=0.7.2
pkgrel=1
pkgdesc="Apache JAMES Mime4j"
arch=('i686' 'x86_64')
url="http://james.apache.org/"
license=("Apache")
depends=('java-runtime')
source=(http://it.apache.contactlab.it//james/mime4j/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	chmod +r *.jar
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}

md5sums=('5fdb0e4931fb502959e523a20cef756a')
