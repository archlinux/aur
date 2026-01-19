# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-old-timey-mono
pkgver=0.9.2
pkgrel=1
pkgdesc="A clean monospace typeface based on Reproducing Typewriter which was available as early as 1906."
arch=("any")
url="https://github.com/dse/old-timey-mono-font"
license=("OFL")
source=("https://github.com/dse/old-timey-mono-font/releases/download/$pkgver/OldTimeyMono-$pkgver.zip")
sha256sums=('0798fb8167d9155f05f725b33b82c38362e0779d1fbba40fd0e88be4bde54e26')

package() {
	install -Dm644 OldTimeyMono-$pkgver/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 OldTimeyMono-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE.md LICENSE
}
