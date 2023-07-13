# Maintainer: Soma Yamamoto <soya_daizu[at]proton[dot]me>

pkgname=ttf-udev-gothic
pkgver=1.3.1
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=("13525cc73ea604b3a40a0e9be222cda41d53c217092546a4b178c7e8bf732002"
            "84004a3038bdf528286a113b4db076d8412bb4ca6771d02a240318473f9b9fce"
            "3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0")

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
