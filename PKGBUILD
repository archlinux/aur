# Maintainer: Paul Skomorowski <arch@skomorowski.at>

pkgname=numptyphysics
pkgver=0.3.9
pkgrel=1
pkgdesc="A crayon-drawing based physics puzzle game"
arch=('x86_64')
url="https://github.com/thp/numptyphysics"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
md5sums=('38d79b37733054ec52d4d393f4c02726')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
