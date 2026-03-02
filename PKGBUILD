# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-old-timey-mono
pkgver=0.11.1
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
sha256sums=('1630b8c9071e3ffa8d83a68fd52b11837847907e7e8324f431c3f793ac54634f'
            '7d048b5cd92233107c231d776db9a306b56572377a25b59bf3ab84298a815613')

package() {
	install -Dm644 OldTimeyMono-$pkgver/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	# install -Dm644 OldTimeyMono-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE.md LICENSE
}
