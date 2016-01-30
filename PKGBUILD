# Maintainer: Phillip Heikoop <git.phillip.h@gmail.com>
pkgname=todo
pkgver=0.9
pkgrel=1
epoch=
pkgdesc="CLI to-do list manager"
arch=('any')
url="https://github.com/phillip-h/todo"
license=('MIT')
groups=()
depends=('ncurses')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/phillip-h/todo/archive/v0.9.tar.gz")
noextract=()
md5sums=('3d2b25ad676a5c940072c2d730dc4dd7')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
    #install -D "completion/todoc" "$pkgdir/usr/share/bash-completion/completions/todo"
}
