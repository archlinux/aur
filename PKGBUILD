# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=htmlunit
pkgver=2.33
pkgrel=1
pkgdesc="A HTTP headless webclient for Java"
arch=('any')
url="http://htmlunit.sourceforge.net/"
license=('apache')
depends=('java-runtime-common')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip")
md5sums=('7d373c517729a07b4d53636452476cab')
sha256sums=('8066b62ef214a84c4f1c573b81c262b63a0e139699cb0b686ff5c0baed30872b')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}
