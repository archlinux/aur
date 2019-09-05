pkgname="font-victor-mono"
pkgver=1.2.6
_refcommit="68b7add39c619c96f0394b82b51f113501b55c77"
pkgrel=1
pkgdesc="A programming font with cursive italics and ligatures."
arch=(any)
url="https://rubjo.github.io/victor-mono"
source=(
    "victor-mono-$pkgver.zip::https://github.com/rubjo/victor-mono/raw/$_refcommit/public/VictorMonoAll.zip"
)
sha256sums=(
    "14ede192570e6b422e9ed66bf76c9adb28dc56bdd52a83d44115d31737f1a037"
)

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

