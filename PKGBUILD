# Maintainer: Ricky Liou <rliou92@gmail.com>
pkgname=umonitor-git
_gitname=umonitor
pkgver=20170518
pkgrel=1
pkgdesc="Dynamic monitor configuration"
arch=('i686' 'x86_64')
url="https://github.com/rliou92/umonitor"
license=('MIT')
depends=('libconfig' 'libxcb')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${_gitname}.install
changelog=
source=("git://github.com/rliou92/${_gitname}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd $srcdir/$_gitname
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR="$pkgdir" install
}
