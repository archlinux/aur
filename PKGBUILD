# Maintainer: Ryan Chan <rycwo at posteo dot net>

pkgname="lemons"
pkgver="0.6.0"
pkgrel=4
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
sha256sums=('bdbc5478ad44acc5d4d301152b5a427876cecafb57dd3de82ed13cd54059f82d')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
