# Maintainer: atomicbeef <teddyg522@gmail.com>
pkgname=purple-libnotify-plus
pkgver=2.99.1
pkgrel=1
pkgdesc="Event dispatching for purple-events through libnotify"
arch=('i686' 'x86_64')
url="https://github.com/sardemff7/purple-libnotify-plus"
license=('GPL')
depends=('purple-events' 'libnotify' 'libpurple')
source=("https://download.tuxfamily.org/purpleevents/purple-libnotify-plus/purple-libnotify-plus-2.99.1.tar.xz")
md5sums=('bbcd43045010abc3ff2bb01da7115551')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
