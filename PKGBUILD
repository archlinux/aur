# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgname=berry-git
pkgbase=berry
pkgver=0.0.2
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=(
  "https://github.com/JLErvin/berry/archive/master.zip"
)
sha256sums=('SKIP')

build() {
	cd berry-master/
	
	make
}

package() {
	cd berry-master/
	
	make DESTDIR="$pkgdir/" install
}
