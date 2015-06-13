# Maintainer: Muflone <muflone@vbsimple.net>
pkgname=tn5250j-plugin-kunststoff
pkgver=2.0.2
pkgrel=2
pkgdesc="Support for Kunststoff look and feel in tn5250j"
arch=(any)
url="http://kunstoff.incors.com/archive/"
license=('LGPL')
depends=(tn5250j)
source=("http://kunstoff.incors.com/archive/kunststoff-${pkgver//\./_}.zip")
md5sums=('d6103e5a570560d0624ca8f515c78e66')

package() {
  # Install files for the package
  install -m 644 -D "$srcdir/kunststoff.jar" "$pkgdir/usr/share/java/tn5250j/kunststoff.jar"
}


