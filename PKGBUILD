# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)
pkgname=pari-elldata
pkgver=20190912
pkgrel=1
pkgdesc="pari package of J. E. Cremona Elliptic Curve Data."
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari>=2.2.11')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz"
        "http://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz.asc")
validpgpkeys=('42028EA404A2E9D80AC453148F0E7C2B4522E387')
md5sums=('056b157897b35641844a1267f69558d6'
         'SKIP')
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/elldata $pkgdir/usr/share/pari
}
