# Maintainer: Rafail Ketsetsidis <raf at k9s dot gr>
pkgname=powermon
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Battery power draw attribution utility"
arch=('x86_64')
url="https://sr.ht/~rafket/powermon"
license=('0BSD')
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
source=("https://git.sr.ht/~rafket/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('abab58c4966eb2f836936e72593783b2aefe2205131557e0785b870448e22d17')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
        make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
