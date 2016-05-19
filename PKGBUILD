# Maintainer: wtx <sdrb@onet.eu>

pkgname=antlr27
pkgver=2.7.7
pkgrel=1
pkgdesc="ANother Tool for Language Recognition"
arch=('x86_64')
url="http://www.antlr.org/"
license=('BSD')
depends=('dpkg')
source=('http://ftp.funet.fi/pub/Linux/INSTALL/Ubuntu/archive/pool/main/a/antlr/libantlr-java_2.7.7+dfsg-6_all.deb'
	'http://ftp.funet.fi/pub/Linux/INSTALL/Ubuntu/archive/pool/main/a/antlr/antlr_2.7.7+dfsg-6_all.deb')
sha1sums=('50f49bdfc9fa190715d13ca3f06a8ba9d6e34259' 
	'82f0033e967079c64351d5fb42e473daebb5889a')

prepare() {
	dpkg-deb -x libantlr-java_2.7.7+dfsg-6_all.deb ${srcdir}
	dpkg-deb -x antlr_2.7.7+dfsg-6_all.deb ${srcdir}
	
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}
}
