# Maintainer: Muflone <muflone@vbsimple.net>
pkgname=tn5250j-plugin-itext
pkgver=4.2.0
pkgrel=1
pkgdesc="Support for spool and text transformation in tn5250j"
arch=(any)
url="https://github.com/ymasory/iText-4.2.0/"
license=('LGPL')
depends=(tn5250j)
source=("https://github.com/downloads/ymasory/iText-${pkgver}/iText-${pkgver}.jar")
md5sums=('b2c1f84b9960ba3cc336ef25a4fa3c65')
noextract=("iText-${pkgver}.jar")

package() {
  # Install files for the package
  install -m 644 -D "$srcdir/iText-${pkgver}.jar" "$pkgdir/usr/share/java/tn5250j/itext.jar"
}

