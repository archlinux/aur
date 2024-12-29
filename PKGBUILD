# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-udev-gothic
pkgver=2.1.0
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and JetBrains Mono"
arch=(any)
url="https://github.com/yuru7/udev-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/UDEVGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_NF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/UDEVGothic_HS_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/udev-gothic/v$pkgver/LICENSE")
sha256sums=('69c9321d3bac85589ddfee730e9582e3a9ca664d84d520fa7a70f656f1a0b8e5'
            '2d3ea89a7dfbf5ad07893fa1a39894f5860a146fd2633311176c61dcca6120e7'
            '25e6730e929194b15d788aa9a67f0b8285214904a693c753ecbb020da54abe0f'
            '3e04c747c9c9535224f6163a290caf022877759db5183a00aef6134d3f5643f0')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_NF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 UDEVGothic_HS_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
