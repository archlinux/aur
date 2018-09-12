# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=htmlunit
pkgver=2.32
pkgrel=1
pkgdesc="A HTTP headless webclient for Java"
arch=('any')
url="http://htmlunit.sourceforge.net/"
license=('apache')
depends=('java-runtime-common')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip")
md5sums=('0b53c0b8c68ee6a0efe4e239565e8e60')
sha256sums=('0b2e5867cf44bccb6e22c7fdcaaa3b19cb65a0f2b9ef8b8442844aaf83e60201')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/lib
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp *.jar $pkgdir/usr/share/java/${pkgname}
}
