# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)
pkgname=pari-elldata
pkgver=20160215
pkgrel=1
pkgdesc="pari package of J. E. Cremona Elliptic Curve Data."
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari>=2.2.11')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz")
md5sums=(a6a062a0c2f71bd69afc5bf7a30bd5ac)
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/elldata $pkgdir/usr/share/pari
}
