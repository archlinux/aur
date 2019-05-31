# Maintainer: Ryan Chan <ryan at rycwo dot xyz>

pkgname="lemons"
pkgver="0.4.0"
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
optdepends=("ttf-dejavu: for a nice default font")
source=("https://git.sr.ht/~rycwo/""$pkgname""/archive/""$pkgver"".tar.gz")
sha256sums=('175d7b5661f5403f038488d4bd5cad102fa23d884f6821e363518f4092ef436c')

package() {
	cd "$srcdir""/""$pkgname""-""$pkgver"
	install -Dm644 LICENSE "$pkgdir""/usr/share/licenses/""$pkgname""/LICENSE"
	install -Dm755 lemons "$pkgdir""/usr/bin/lemons"
}
