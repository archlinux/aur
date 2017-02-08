
# Maintainer: LighDot <lightdot -a-t- g m a i l>
pkgname=tg
pkgver=0.4.0
pkgrel=1
pkgdesc="An advanced cross-platform solution for timing mechanical watches, a timegrapher. Also known as tg-timer."
arch=('i686' 'x86_64')
url="https://github.com/vacaboja/tg"
license=('GPL2')
depends=('gtk2' 'portaudio' 'fftw')
provides=('tg-timer')
conflicts=('tg' 'tg-timer')
source=('https://github.com/vacaboja/tg/archive/v0.4.0.tar.gz')
md5sums=('71f1cbf741755dbdda1e0459a31b8b6d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
}
