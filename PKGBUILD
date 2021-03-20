# Maintainer:  Charlotte Ausel <TheSheepGuy1@gmail.com>

pkgname=otf-edwin
pkgver=0.52
pkgrel=1
pkgdesc="A text font for musical scores"
arch=('any')
url="https://github.com/MuseScoreFonts/Edwin"
license=('OFL')
source=("https://github.com/MuseScoreFonts/Edwin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef241488b66ea4673e44265d8723b4f095aa851398a8c399f7045d189eae8b15')

package() {
	cd "$srcdir/Edwin-$pkgver"
	install -dm755 "$pkgdir/usr/share/fonts/OTF"
	install -Dm644 Edwin*.otf "$pkgdir/usr/share/fonts/OTF"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
