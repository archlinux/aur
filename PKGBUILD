# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-kermit
pkgver=0.0.0
pkgrel=1
# should maybe find a better description
pkgdesc="Using typeface design to empower children by making reading easier, improving comprehension, and helping dyslexics"
arch=("any")
url="https://kermit-font.com"
# license=("OFL")
source=(
	"KermitRoman-VF.otf::https://kermit-font.com/_css/KermitRoman-VF.otf"
	"KermitItalic-VF.otf::https://kermit-font.com/_css/KermitItalic-VF.otf"
)
sha256sums=("SKIP" "SKIP")

package() {
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	# install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
