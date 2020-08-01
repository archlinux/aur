# Maintainer: Addison Bean <addisonbean@gmail.com>

pkgname=ttf-scientifica
pkgver=2.1
pkgrel=0
pkgdesc="tall, condensed, bitmap font for geeks."
arch=("any")
url="https://github.com/NerdyPepper/scientifica"
license=("OFL")
source=(
	"https://github.com/NerdyPepper/scientifica/releases/download/v2.1/scientifica-v2.1.tar"
	"https://raw.githubusercontent.com/NerdyPepper/scientifica/e51563ba9ab5d15a3091b599d568ad8764791123/LICENSE"
)
sha256sums=(
	"3159ce09e7850309c3c32a884870f77ed5fcb01f7a2e6ebc9a84bba7cd7e5ab6"
	"0ee971a4d5eefffd0fd3998da2d4901f5b6e5c2bdc96465dd4d451f4cc1831a4"
)

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/scientifica/ttf/"*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/scientifica" "$srcdir/LICENSE"
}
