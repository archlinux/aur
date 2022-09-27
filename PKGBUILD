# Maintainer: Ryan Chan <rycwo at posteo dot net>

pkgname="lemons"
pkgver="0.6.3"
pkgrel=1
pkgdesc="Output script for lemonbar"
arch=("any")
url="https://git.sr.ht/~rycwo/lemons"
license=("custom:WTFPL")
depends=(
	"bash"
	"lemonbar-xft-git"
	"ttf-font-awesome-4"
	"acpi"
	"bspwm"
	"iw")
optdepends=(
	"pipewire-pulse: for volume display (either pipewire or pulseaudio must be installed)"
	"pulseaudio: for volume display"
	"otf-san-francisco-mono: for a nice default font")
source=("https://git.sr.ht/~rycwo/""$pkgname""/archive/""$pkgver"".tar.gz")
sha256sums=('6bf10bdd738789075ceeb47055adea4e3d82910f65f4964c56cd53d111c6acb2')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
