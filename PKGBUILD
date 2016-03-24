# Maintainer: Peter Olsson <dataapa at gmail dot com>
pkgname=brumbrumrally
pkgver=0.6
pkgrel=1
pkgdesc="A 2D racing game"
arch=('i686' 'x86_64')
url="http://dataapa.net/brumbrumrally/"
license=('GPL3')
depends=('sdl_image' 'sdl_net')
source=(http://dataapa.net/$pkgname/files/$pkgname-$pkgver.tar.gz)
md5sums=('9ac41357e0d647ff13954eb4a4c865dc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
