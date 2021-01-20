# Maintainer:  Charlotte Ausel <TheSheepGuy1@gmail.com>

pkgname=otf-edwin
pkgver=0.5
_commit="9c82277ec584897e4690d3d794fbc9b640b00436"
pkgrel=1
pkgdesc="A text font for musical scores"
arch=('any')
url="https://github.com/MuseScoreFonts/Edwin"
license=('OFL')
source=("https://github.com/MuseScoreFonts/Edwin/archive/$_commit.tar.gz")
sha256sums=('d56e00f9e5da7bb7896c93479fc1d8c375107fe7985c31f0b31eb0bcaded6326')

package() {
	cd "$srcdir/Edwin-$_commit"
	install -dm755 "$pkgdir/usr/share/fonts/OTF"
	install -Dm644 Edwin*.otf "$pkgdir/usr/share/fonts/OTF"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
