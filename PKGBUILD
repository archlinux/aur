# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sacjava
pkgver=1.3
pkgrel=1
license=('custom:W3C')
arch=('any')
pkgdesc="Java implementation of the SAC CSS API"
url="http://www.w3.org/Style/CSS/SAC/"
depends=('java-runtime')
source=("http://www.w3.org/2002/06/${pkgname}-${pkgver}.zip")
md5sums=('91c083636dc1a926bcb5b0bd0bde9ea5')

package() {
  cd "${srcdir}/sac-${pkgver}"
  
  install -Dm644 "COPYRIGHT.html" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT.html"
  install -Dm644 "sac.jar" "${pkgdir}/usr/share/java/sac-${pkgver}.jar"
  ln -s "sac-${pkgver}.jar" "${pkgdir}/usr/share/java/sac.jar"
}
