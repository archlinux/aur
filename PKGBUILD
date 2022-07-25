# Maintainer: Paul Skomorowski <arch@skomorowski.at>

pkgname=numptyphysics
pkgver=0.3.10
pkgrel=1
pkgdesc="A crayon-drawing based physics puzzle game"
arch=('x86_64')
url="https://github.com/thp/numptyphysics"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
md5sums=('311d79475358cb814d997ab8e16a894b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
