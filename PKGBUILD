# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-udev-gothic
pkgver=2.0.0
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_HS_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=('50f04adcae9eaa112aa3d68eb06541ab7502ae976221df2f50195ac7696c74be'
            '551f1e89861f71cdf0c714cea42e503dbec5a6064f07af1711f1731003433039'
            '7b4334786a9d42d5407fd187befc6c92be291ddf9ea678b5e4c6aee266790384'
            '3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_HS_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
