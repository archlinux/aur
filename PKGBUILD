# Maintainer: Devin Hill lvlrk4u@proton.me
pkgname=unpac
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="An epic Namco Museum Remix modding tool"
arch=('x86_64')
url="https://github.com/lvlrk/unpac"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(24cc7d97ed8e27140c88e0b450d5d0d9)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    pwd
	make clean all
}

package() {
	cd "$pkgname-$pkgver"
	sudo make DESTDIR="$pkgdir/" install install-lib
}
