# Maintainer: Taekyung Kim (Taekyung.Kim.Maths@gmail.com)

pkgname=pari-galpol
pkgver=20150915
pkgrel=1
pkgdesc="pari package of the GALPOL database of polynomials defining Galois extensions of the rationals"
arch=('any')
url="http://pari.math.u-bordeaux.fr/"
license=('GPL')
depends=('pari>=2.4.3')
makedepends=()
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/galpol.tgz")
md5sums=(c241b3b40267f640df4d45ed2d604442)
package() {
  mkdir -p $pkgdir/usr/share/pari
  mv data/galpol $pkgdir/usr/share/pari
}
