pkgname="font-victor-mono"
pkgver=1.2.9
pkgrel=1
pkgdesc="A programming font with cursive italics and ligatures."
arch=(any)
url="https://rubjo.github.io/victor-mono"
source=(
    "victor-mono-$pkgver.zip::https://github.com/rubjo/victor-mono/raw/v$pkgver/public/VictorMonoAll.zip"
)
sha256sums=(
    "14e7f9a06e4c88e1dea7bc8c96c7ead1a069b3292bc28c4456abba8833327ca7"
)

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

