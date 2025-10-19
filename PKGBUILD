# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.1.3
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("cpmenu::https://github.com/Sleep-No-More/cpmenu/releases/download/v${pkgver}/cpmenu"
        "LICENSE::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/v${pkgver}/LICENSE"
        "README.md::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/v${pkgver}/README.md")
sha256sums=('0798ca04cc057d7c526834a52d0a41519e32b9c4'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/cpmenu" "$pkgdir/usr/bin/cpmenu"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
