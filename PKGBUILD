# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=jopenchart
pkgver=0.94
pkgrel=1
pkgdesc="JOpenChart is a Java Toolkit and library for embedding charts into applications"
arch=('any')
url="http://jopenchart.sourceforge.net/"
license=('GPL')
depends=('java-environment')
source=(charting-${pkgver}.jar::http://sourceforge.net/projects/${pkgname}/files/JOpenChart/${pkgver}/charting-${pkgver}.jar/download)

package() {
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}/
  cp ${srcdir}/charting-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/
}

# vim:set ts=2 sw=2 et:
md5sums=('8ed82e81da2383e9cde66dbd0500e9e7')
