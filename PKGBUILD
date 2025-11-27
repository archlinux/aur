# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=pacnew
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="an interactive tool to help manage .pacnew files"
arch=(any)
url="https://github.com/larsch/pacnew"
license=('MIT')
groups=()
depends=(diffutils bash coreutils findutils grep sed)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(pacnew-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/larsch/pacnew/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('db7a43d8a8ac5cddce70f25b6e2bd0a9b51fc2bab991fbd3486364948daa76d3')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 pacnew "$pkgdir/usr/bin/pacnew"
}
