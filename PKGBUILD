# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)
pkgname=pari-elldata
pkgver=20150519
pkgrel=1
pkgdesc="pari package of J. E. Cremona Elliptic Curve Data."
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz")
md5sums=(a738d4c6ebdcfaa222441c0504301d42)
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/elldata $pkgdir/usr/share/pari
}
