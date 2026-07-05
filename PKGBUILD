# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-old-timey-mono
pkgver=0.12.0
pkgrel=1
pkgdesc="A clean monospace typeface based on Reproducing Typewriter which was available as early as 1906."
arch=("any")
url="https://github.com/dse/old-timey-mono-font"
license=("OFL")
source=(
	"https://github.com/dse/old-timey-mono-font/releases/download/v$pkgver/OldTimeyMono-$pkgver.zip"
	# "https://github.com/dse/old-timey-mono-font/raw/refs/heads/master/dist/zip/OldTimeyMono-$pkgver.zip"
	"https://github.com/dse/old-timey-mono-font/raw/refs/tags/v$pkgver/LICENSE.md"
)
sha256sums=('96a75c89565d4a58520be55e0aeec4c0b9eeddc449b1958fd2c5c7e097a06e0b'
            '7d048b5cd92233107c231d776db9a306b56572377a25b59bf3ab84298a815613')

package() {
	install -Dm644 OldTimeyMono-$pkgver/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	# install -Dm644 OldTimeyMono-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE.md LICENSE
}
