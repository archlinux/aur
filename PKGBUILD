# Maintainer: Peter Olsson <dataapa at gmail dot com>
pkgname=brumbrumrally
pkgver=0.7
pkgrel=2
pkgdesc="A 2D racing game"
arch=('i686' 'x86_64' 'aarch64')
url="http://dataapa.net/brumbrumrally/"
license=('GPL3')
depends=('sdl_image' 'sdl_net')
source=(http://dataapa.net/$pkgname/files/$pkgname-$pkgver.tar.gz)
md5sums=('0821baf48b466ba71ca03ab3f00612fa')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
