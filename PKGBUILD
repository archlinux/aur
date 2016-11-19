# Maintainer: Brian Steffens <briansteffens@gmail.com>
pkgname=hexitor
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A terminal hex editor"
arch=('i686' 'x86_64')
url="https://github.com/briansteffens/hexitor"
license=('GPL')
groups=()
depends=()
makedepends=("ncurses")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-*}::git+https://github.com/briansteffens/hexitor.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
