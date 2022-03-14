# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-bangers
pkgver=1.0
pkgrel=3
pkgdesc='Comic books font with capital letters'
arch=(any)
url="https://fonts.google.com/specimen/Bangers"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Bangers")
sha256sums=('SKIP')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" Bangers-Regular.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
