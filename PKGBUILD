# Maintainer: t4t5 <t4t5@hey.com>
pkgname=hypruler-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Measure anything on your screen."
arch=('x86_64')
url="https://github.com/t4t5/hypruler"
license=('MIT')
depends=('fontconfig')
provides=('hypruler')
conflicts=('hypruler')
options=('!debug')
source=("hypruler-$pkgver::https://github.com/t4t5/hypruler/releases/download/v$pkgver/hypruler"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/t4t5/hypruler/v$pkgver/LICENSE")
sha256sums=('4b9ea6f5a7ece8f0faf4395f434297d85826ab7911075d1f01368cc0e93f5561'
            '52839f7b0ceef1ae4b6a95d7f96c51658744d2fb18e5a2b9e65ebffe88b33b16')

package() {
    install -Dm755 "hypruler-$pkgver" "$pkgdir/usr/bin/hypruler"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
