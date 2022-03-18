# Maintainer: abxxbo <devavcado@gmail.com
pkgname=awm-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A floating window manager written with XCB."
arch=(x86_64 x86)
url="https://github.com/abxxbo/awm.git"
license=('GPL')
groups=()
depends=()
makedepends=(libxcb xcb-util xcb-util-keysyms xcb-util-wm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd awm
	make
}

package() {
	cd awm
	make DESTDIR="$pkgdir/" install
}
