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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/cpmenu" "$pkgdir/usr/bin/cpmenu"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
