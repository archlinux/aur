# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-udev-gothic
pkgver=2.2.0
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_HS_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=('c104c171f6ed8922ca52d74cd915a271e427f1e884e51431aae71d99e8b3b47b'
            '45faeef7b5d8bc591bcc5887a2ca0c5fb9028066f18a5a52cd6f10b7d655ba37'
            '570d03cb98d15834a5f6e1323843dfdc9f79d4b0c4bace123bb12de0806d9545'
            '3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_HS_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
