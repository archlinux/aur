# Maintainer: Ryan Chan <rycwo at posteo dot net>

pkgname="lemons"
pkgver="0.6.0"
pkgrel=3
pkgdesc="Output script for lemonbar"
arch=("any")
url="https://git.sr.ht/~rycwo/lemons"
license=("custom:WTFPL")
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
optdepends=("otf-san-francisco-mono: for a nice default font")
source=("https://git.sr.ht/~rycwo/""$pkgname""/archive/""$pkgver"".tar.gz")
sha256sums=('59cd16176a7c21eba5cbe16618d1d1e367404151f4dd92ee23217aaad2f96631')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
