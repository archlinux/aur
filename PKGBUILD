# Maintainer: Fauna <aur@bertie.io>
pkgname=Meowdo-git
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc='A cute, keyboard-driven todo list with a cat sidekick.'
arch=(x86_64)
url='https://github.com/Sycorlax/Meowdo.git'
license=('GPL 3.0')
groups=()
depends=(ncurses)
makedepends=(git make gcc)
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
sha256sums=('SKIP')
validpgpkeys=('SKIP')


build() {
	cd "Meowdo"
	make
}

package() {
	cd "Meowdo"
	cp "meowdo" $pkgdir/
}
