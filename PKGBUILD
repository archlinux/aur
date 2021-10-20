# Maintainer: Addison Bean <addisonbean@gmail.com>

pkgname=ttf-scientifica
pkgver=2.3
pkgrel=0
pkgdesc="tall, condensed, bitmap font for geeks."
arch=("any")
url="https://github.com/NerdyPepper/scientifica"
license=("OFL")
source=(
	"https://github.com/NerdyPepper/scientifica/releases/download/v2.3/scientifica.tar"
	"https://raw.githubusercontent.com/NerdyPepper/scientifica/8cdde9def8b20080b0de9f52d86802ff218d8fc1/LICENSE"
)
sha256sums=(
	"f0857869a0e846c6f175dcb853dd1f119ea17a75218e63b7f0736d5a8e1e8a7f"
	"5fe3133335d5a3a32865f2b5cc133ed092c12aa65fcde525b68045e14312cd61"
)

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/scientifica/ttf/"*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/scientifica" "$srcdir/LICENSE"
}
