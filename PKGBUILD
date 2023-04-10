# Maintainer: Soma Yamamoto <soya_daizu[at]proton[dot]me>

pkgname=ttf-udev-gothic
pkgver=1.2.0
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=("565b021d9268d9f10e88628799b4b4c2637e19605902c74d28689f5fbcdfe64d"
            "ce74ce77e993d9ce616a4a5a35c7e5e0e06e75c883e98d2cae8d8191008e10c2"
            "3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0")

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
