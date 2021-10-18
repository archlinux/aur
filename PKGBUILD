# Maintainer: William Kozma <captain.john.s.tuttle@gmail.com>
pkgname=whattodo
pkgver=0.0.1
pkgrel=1
pkgdesc="Another todo command line Utility. (But this one is made in Java)"
arch=(x86_64)
url="https://github.com/will-t-f/whattodo.git"
license=('MIT')
groups=()
depends=(jdk-openjdk)
makedepends=(git make)
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
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
