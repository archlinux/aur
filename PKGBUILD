# Maintainer: Soma Yamamoto <soya_daizu[at]proton[dot]me>

pkgname=ttf-udev-gothic
pkgver=1.1.0
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=("959f4a687ce960ba8f67ce323843c119373a923c1b6216c944bf34c8a641536e"
            "13763a5d7d0cf2a025740b910820933af745a1734baf730c910fad82ffa85178"
            "3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0")

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
