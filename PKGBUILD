# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=backman

pkgver=0.1
pkgrel=0

pkgdesc="Backman is a random/fixed background image setter for wlroots based compositors"
arch=("x86_64")
url="https://github.com/loadofearth/backman"
license=('MIT')
depends=(
		"python>=3.5"
		"swaybg"
		"python-toml"
		)
makedepends=("git")
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/loadofearth/backman/archive/refs/tags/0.1.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 backman "$pkgdir/usr/bin/backman"
}
