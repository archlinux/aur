# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.1.4
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("cpmenu::https://github.com/Sleep-No-More/cpmenu/releases/download/v${pkgver}/cpmenu"
        "LICENSE::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/v${pkgver}/LICENSE"
        "README.md::https://raw.githubusercontent.com/Sleep-No-More/cpmenu/v${pkgver}/README.md")
sha256sums=('84db68da89bc311fb3b6f1bfba1770a98bf265d9d38c5dbe56134e38abb62df8'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/cpmenu" "$pkgdir/usr/bin/cpmenu"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
