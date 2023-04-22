# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hayden Johnson <hajohn100@gmail.com>
pkgname=chessterm
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Play Chess in the terminal!"
arch=('x86_64')
url="https://github.com/Chewt/chessterm"
license=('MIT')
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
install=
changelog=
source=("https://github.com/Chewt/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
	install -m755 -D "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
