# Maintainer: Gerald Bischof gBischof at gebix dot com
pkgname=qsvgstyle
pkgver=20190706
pkgrel=1
epoch=
pkgdesc="Themeable SVG style for KDE Plasma"
arch=(x86_64)
url="https://github.com/DexterMagnific/QSvgStyle"
license=('GPL2')
groups=()
depends=(qt5-x11extras qt5-svg)
makedepends=(qt5-tools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/DexterMagnific/QSvgStyle.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	qmake
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}
