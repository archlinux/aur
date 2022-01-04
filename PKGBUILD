# Maintainer:  Charlotte Ausel <ettolrach@disroot.org>

pkgname=otf-edwin
pkgver=0.53
pkgrel=1
pkgdesc="A text font for musical scores"
arch=('any')
url="https://github.com/MuseScoreFonts/Edwin"
license=('OFL')
source=("https://github.com/MuseScoreFonts/Edwin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aee59e748fc616867ad40d57d672f7c9ada49e213c1d19fbea33e60ce57b64d7')

package() {
	cd "$srcdir/Edwin-$pkgver"
	install -dm755 "$pkgdir/usr/share/fonts/OTF"
	install -Dm644 Edwin*.otf "$pkgdir/usr/share/fonts/OTF"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
