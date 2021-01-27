# Maintainer: Your Tambup <alberto.tamburini@hotmail.it>
pkgname=ff-planner
pkgver=2.3
pkgrel=1
epoch=
pkgdesc="The ff planner implementation by J. Hoffmann."
arch=('x86_64')
url="https://fai.cs.uni-saarland.de/hoffmann/ff.html"
license=('GPL3')
groups=()
depends=()
makedepends=(
	'flex'
	'bison'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://fai.cs.uni-saarland.de/hoffmann/ff/FF-v2.3.tgz")
noextract=()
md5sums=('709a3c5c4b327b44c7f182ceaaa9481d')
validpgpkeys=()

build() {
	cd "$srcdir/FF-v$pkgver"
	make CFLAGS='-fcommon'
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "$srcdir/FF-v$pkgver/ff" "$pkgdir/usr/bin/ff-planner"
}
