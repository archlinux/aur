# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=pacnew
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="an interactive tool to help manage .pacnew files"
arch=(any)
url="https://github.com/larsch/pacnew"
license=('Unlicense')
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
source=("pacnew-v1.1.tar.gz::https://github.com/larsch/pacnew/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('8793f74fa51a6aad61058a990fa2e9ebbaa53725b449b2ed09dd62e16230d174')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 pacnew "$pkgdir/usr/bin/pacnew"
}
