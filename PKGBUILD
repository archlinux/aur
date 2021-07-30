# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.0.3
pkgrel=1
arch=('x86_64')
url="https://notabug.org/tomtsagk/$pkgname"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=($pkgname-$pkgver.tar.gz::https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('3464690588e0f44f88eaf23fbc0feba4')

build() {
	cd "$pkgname"
	make prefix=/usr
}

package() {
	cd "$pkgname"
	make prefix="$pkgdir"/usr install
}
