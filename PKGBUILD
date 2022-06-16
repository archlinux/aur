# Maintainer:  Charlotte Ausel <ettolrach@disroot.org>

pkgname=otf-edwin
pkgver=0.54
pkgrel=1
pkgdesc="A text font for musical scores"
arch=('any')
url="https://github.com/MuseScoreFonts/Edwin"
license=('OFL')
source=("https://github.com/MuseScoreFonts/Edwin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17a073c27aec6842de81da3a05d8eed4e1be448f732a79f8b48012477abacd89')

package() {
	cd "$srcdir/Edwin-$pkgver"
	install -dm755 "$pkgdir/usr/share/fonts/OTF"
	install -Dm644 Edwin*.otf "$pkgdir/usr/share/fonts/OTF"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
