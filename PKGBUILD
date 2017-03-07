# Contrinutor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=pokoy
pkgver=0.2.2
pkgrel=1
pkgdesc='Lightweight daemon for X that helps prevent RSI and other computer related stress'
arch=('i686' 'x86_64')
url='https://github.com/ttygde/pokoy'
license=('GPL2')
depends=('xcb-util-wm' 'xcb-util-keysyms')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ttygde/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ea74913145ee81a63189a9396c246af6')

build() {
	make -C $pkgname-$pkgver
}

package() {
	make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

