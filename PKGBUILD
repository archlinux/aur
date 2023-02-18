# Maintainer: Paul Skomorowski <arch@skomorowski.at>

pkgname=numptyphysics
pkgver=0.3.10
pkgrel=1
pkgdesc="A crayon-drawing based physics puzzle game"
arch=('x86_64')
url="https://gitlab.com/thp/numptyphysics"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.zip::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('03aa321a61d392d81d68f08120b60070')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
