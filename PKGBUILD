# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)
pkgname=pari-elldata
pkgver=20161017
pkgrel=1
pkgdesc="pari package of J. E. Cremona Elliptic Curve Data."
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari>=2.2.11')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz")
md5sums=(0ae49b7aa6a012ccd2804bfb831d3686)
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/elldata $pkgdir/usr/share/pari
}
