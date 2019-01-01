# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)

pkgname=pari-galpol
pkgver=20180625
pkgrel=1
pkgdesc="pari package of the GALPOL database of polynomials defining Galois extensions of the rationals"
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari>=2.4.3')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/galpol.tgz")
md5sums=('6ebd6057f1b252f7f9b77525c27f447d')
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/galpol $pkgdir/usr/share/pari
}
