# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Julius Drodofsky <juliusdrodofsky@outlook.de>
pkgname=mines-tui
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A Terminal based Minesweeper implementation"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/Judro/mines"
license=('BSD')
groups=()
depends=(ncurses)
makedepends=(git make gcc ncurses)
checkdepends=()
optdepends=()
provides=(mines)
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
	cd mines
	make
}


package() {
	cd mines
	sudo make install
}
