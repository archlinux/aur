# Maintainer: Jozef Riha <jose1711 gmail com>

pkgname=soundsort
arch=('i686' 'x86_64')
pkgver=1.0
pkgrel=3
license=('GPL')
pkgdesc="utility that analyzes the audio-files you feed it and does a suggestion on their order by analyzing how the songs are actually sounding"
url="http://www.vanheusden.com/soundsort/"
depends=('libsndfile' 'fftw' 'libmad')
# source=("http://www.vanheusden.com/soundsort/${pkgname}-${pkgver}.tgz")
source=("http://web.archive.org/web/20150803213121if_/http://www.vanheusden.com/soundsort/${pkgname}-${pkgver}.tgz")
md5sums=('eb1ff10fec06a96b0848e57e891e3833')

build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
install -D -m755 $srcdir/$pkgname-$pkgver/soundsort $pkgdir/usr/bin/soundsort
}
