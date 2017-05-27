# Maintainer: Maciej Lechowski <mjlechowski@gmail.com>
pkgname=xstarter
pkgver=0.5.1
_gitname=xstarter
pkgrel=1
epoch=
pkgdesc="Terminal-based application launcher for Unix systems "
arch=('any')
url="https://github.com/lchsk/xstarter"
license=('GPL')
groups=()
depends=('ncurses' 'glib2')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=('xstarter')
conflicts=('xstarter')
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

build() {
	cd ..
	cmake .
	make
}

package() {
	cd ..
	make DESTDIR="$pkgdir/" install
}
