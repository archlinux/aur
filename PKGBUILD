# Maintainer: Muflone <muflone@vbsimple.net>
pkgname=tn5250j-plugin-log4j
pkgver=1.2.15
pkgrel=1
pkgdesc="Support for logging in tn5250j"
arch=(any)
url="http://logging.apache.org/log4j"
license=('GPL')
depends=(tn5250j)
source=("https://archive.apache.org/dist/logging/log4j/${pkgver}/apache-log4j-${pkgver}.tar.gz")
md5sums=('10f04abe4d68d5a89e8eb167e4e45e1a')

package() {
  # Install files for the package
  install -d "$pkgdir/usr/share/java/tn5250j"
  install -m 644 "$srcdir/apache-log4j-${pkgver}/log4j-${pkgver}.jar" "$pkgdir/usr/share/java/tn5250j/log4j-${pkgver}.jar"
}

