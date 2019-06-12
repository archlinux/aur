# Maintainer: Ryan Chan <ryan at rycwo dot xyz>

pkgname="lemons"
pkgver="0.5.0"
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
	"bspwm"
	"iw")
optdepends=("otf-sfmono: for a nice default font")
source=("https://git.sr.ht/~rycwo/""$pkgname""/archive/""$pkgver"".tar.gz")
sha256sums=('ddd1981aa586c59ee5e9cc4fc88de5a8f252bb3bc9abf9b7354106b7e5d3f420')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
