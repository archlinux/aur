# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=htmlunit
pkgver=2.31
pkgrel=1
pkgdesc="A HTTP headless webclient for Java"
arch=('any')
url="http://htmlunit.sourceforge.net/"
license=('apache')
depends=('java-runtime-common')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip")
md5sums=('21b752b9e3cb8d8ad9a93e939993020d')
sha256sums=('9044000bd4b78650953bdb605ffd19f52392ff7bf56be1768ef7de4f03c90d85')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}
