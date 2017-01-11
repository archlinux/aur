# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=htmlunit
pkgver=2.24
pkgrel=1
pkgdesc="A HTTP headless webclient for Java"
arch=('any')
url="http://htmlunit.sourceforge.net/"
license=('apache')
depends=('java-runtime-common')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip")
md5sums=('ac58ce9643d8c48ff45505218574e59f')
sha256sums=('114b25e08b4cf88e7575d7c19bda432dcdd0d5330c867de0dbee7a3e74898a60')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}
