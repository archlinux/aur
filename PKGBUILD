# Maintainer: t4t5 <t4t5@hey.com>
pkgname=hypruler-bin
pkgver=0.1.3
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
sha256sums=('1ae169306f5651857391296a0922e4f210f0745eb981cdcc0583092504241ae8'
            '52839f7b0ceef1ae4b6a95d7f96c51658744d2fb18e5a2b9e65ebffe88b33b16')

package() {
    install -Dm755 "hypruler-$pkgver" "$pkgdir/usr/bin/hypruler"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
