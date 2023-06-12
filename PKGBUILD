# Maintainer: Jakub Skowron <jakubskowron676@gmail.com>
pkgname=scolorpicker
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="smooll Color Picker for X11"
arch=('x86_64')
url="https://www.github.com/reallySmooll/scolorpicker"
license=('MIT')
groups=()
depends=('libx11' 'glibc')
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
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	make build
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make INSTALLDIR="$pkgdir/usr/bin" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
