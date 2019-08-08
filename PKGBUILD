pkgname="font-victor-mono"
pkgver=1.2.3
pkgrel=1
pkgdesc="A programming font with cursive italics and ligatures."
arch=(any)
url="https://rubjo.github.io/victor-mono"
source=(
    "victor-mono-$pkgver.zip::https://github.com/rubjo/victor-mono/raw/v$pkgver/public/VictorMonoAll.zip"
)
sha256sums=(
    "27117f982b002a42e6261c150fe046e41aa85e84f6af8fb9441f7c04680f1691"
)

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

