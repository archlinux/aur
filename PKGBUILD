# Maintainer: Jozef Riha <jose1711 gmail com>

pkgname=soundsort
arch=('i686')
pkgver=1.0
pkgrel=1
license=('GPL')
pkgdesc="utility that analyzes the audio-files you feed it and does a suggestion on their order by analyzing how the songs are actually sounding"
url="http://www.vanheusden.com/soundsort/"
depends=('libsndfile' 'fftw' 'libmad')
source=("http://www.vanheusden.com/soundsort/${pkgname}-${pkgver}.tgz")
md5sums=('08a22f610ab48a4ad802d0e5bba8aef7')

build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
install -D -m755 $srcdir/$pkgname-$pkgver/soundsort $pkgdir/usr/bin/soundsort
}
