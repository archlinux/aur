# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=backman

pkgver=0.4
pkgrel=0

pkgdesc="Backman is a random/fixed background image setter for major GTK desktops, X11, sway and other wlroots based wayland compositors"
arch=("any")
url="https://github.com/securearth/backman"
license=('MIT')
depends=(
		"python>=3.5"
		"swaybg"
		"python-toml"
		"hsetroot"
        	"bash"
		)
makedepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/securearth/backman/archive/refs/tags/0.4.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 backman "$pkgdir/usr/bin/backman"
	install -Dm755 set_xfce "$pkgdir/usr/share/backman/set_xfce"
	install -Dm 644 fix_bg.png "$pkgdir/usr/share/backman/fix_bg.png"
}
