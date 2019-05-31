# Maintainer: Ryan Chan <ryan at rycwo dot xyz>

pkgname="lemons"
pkgver="0.3.3"
pkgrel=1
pkgdesc="Output script for lemonbar"
arch=("any")
url="https://git.sr.ht/~rycwo/lemons"
license=("custom:Unlicense")
depends=(
	"bash"
	"lemonbar-xft-git"
	"ttf-font-awesome-4"
	"acpi"
	"alsa-utils"
	"pulseaudio"
	"pulseaudio-alsa"
	"bspwm")
optdepends=("ttf-dejavu: for a nice default font")
source=("https://git.sr.ht/~rycwo/""$pkgname""/archive/""$pkgver"".tar.gz")
sha256sums=('c283cc705d0fcbe5a00189257611303d6b8faacb174080d9b8b1052b30377c3f')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
