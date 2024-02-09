# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=0.0.2
pkgrel=1
pkgdesc="A composite font of IBM Plex Sans JP and Monaspace"
arch=(any)
url="https://github.com/yuru7/moralerspace"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/Moralerspace_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/moralerspace/v$pkgver/LICENSE")
sha256sums=('85b10cfa6b3c43b390c5949fe9e1dedc83804d5f681109f5a7571c950f974115'
            '9d23767271951afeaddbe5de4dec5d1cb60456c06f45e4d04fbb9ab517d79e30')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Moralerspace_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
