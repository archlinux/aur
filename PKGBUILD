# Maintainer: t4t5 <tristan@trist.dev>
pkgname=hypruler-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Measure anything on your screen."
arch=('x86_64')
url="https://github.com/t4t5/hypruler"
license=('MIT')
depends=('fontconfig')
provides=('hypruler')
conflicts=('hypruler')
source=("hypruler-$pkgver::https://github.com/t4t5/hypruler/releases/download/v$pkgver/hypruler"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/t4t5/hypruler/v$pkgver/LICENSE")
sha256sums=('f2290fdf3bf796fcf2d5835a710fbaf1455f51a0ac873338c1a613f03780e1e9'
            '52839f7b0ceef1ae4b6a95d7f96c51658744d2fb18e5a2b9e65ebffe88b33b16')

package() {
    install -Dm755 "hypruler-$pkgver" "$pkgdir/usr/bin/hypruler"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
