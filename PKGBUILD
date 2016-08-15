# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

pkgname=pari-seadata
pkgver=20090618
pkgrel=1
epoch=1
pkgdesc='pari package needed by ellap for large primes'
url='http://pari.math.u-bordeaux.fr/packages.html'
license=('GPL')
arch=('any')
depends=('pari>=2.4.3')
source=("http://pari.math.u-bordeaux.fr/pub/pari/packages/seadata.tgz")
md5sums=(6e9c119ccb3c65916a48e1a8cd899558)
conflicts=('pari-seadata-small')
provides=('pari-seadata-small')

package() {
	mkdir -p $pkgdir/usr/share/pari
	mv data/seadata $pkgdir/usr/share/pari
}
