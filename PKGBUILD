# Maintainer: Afify <hassan[ap]afify[dot]dev>
pkgname=sfm
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="sfm is a simple file manager for unix-like systems"
arch=('x86_64')
url="https://git.afify.dev/sfm"
license=('ISC')
depends=('make' 'clang')
groups=()
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
source=("https://git.afify.dev/sfm/releases/$pkgname-v$pkgver.tar.gz")
sha256sums=("ae0f610c29246aeb6ca1e1bc40868820b2fc59ee7d27c57fe03f97f4cd316344")
noextract=()
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
