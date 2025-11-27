# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pacnew
pkgver=1.0
pkgrel=1
epoch=
pkgdesc=""
arch=(any)
url=""
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
