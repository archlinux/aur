# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.2.0
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("cpmenu::https://github.com/Sleep-No-More/cpmenu/releases/download/${pkgver}/cpmenu"
        "LICENSE::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/${pkgver}/LICENSE"
        "README.md::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/${pkgver}/README.md")
sha256sums=('d2f065de4a90050dfd62b220810e406b1f999726d244224575ac3b7d774a189c'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/cpmenu" "$pkgdir/usr/bin/cpmenu"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
