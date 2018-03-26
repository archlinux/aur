# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=htmlunit
pkgver=2.29
pkgrel=1
pkgdesc="A HTTP headless webclient for Java"
arch=('any')
url="http://htmlunit.sourceforge.net/"
license=('apache')
depends=('java-runtime-common')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip")
md5sums=('e4d153841521877796727b8f187def5f')
sha256sums=('df57b7faaf1f1ed8ba164640b261b89ba7124fc34f9133d74e927fa7cdf9ee9f')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}
