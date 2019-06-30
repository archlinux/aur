pkgname="font-victor-mono"
pkgver=1.2.0
pkgrel=1
pkgdesc="A programming font with cursive italics and ligatures."
arch=(any)
url="https://rubjo.github.io/victor-mono"
source=(
    "https://github.com/rubjo/victor-mono/raw/v$pkgver/public/VictorMonoAll.zip"
)
sha256sums=(
    "9c4893c1cbef513054697e34abdaf856b48dded91e2d7354244a78cbc4e11f07"
)

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

