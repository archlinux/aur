# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-old-timey-mono
pkgver=0.9.1
pkgrel=1
pkgdesc="A clean monospace typeface based on Reproducing Typewriter which was available as early as 1906."
arch=("any")
url="https://webonastick.com/fonts/old-timey-mono"
license=("OFL")
source=(
	"https://github.com/user-attachments/files/20030127/OldTimeyMono-0.9.1.zip"
)
sha256sums=(
	"5f12a25e31d2aab27724700fec6b4a73586bea423c83c46229c423ee4850a797"
)

package() {
	install -Dm644 OldTimeyMono-0.9.1/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 OldTimeyMono-0.9.1/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE.md OFL.md
}
