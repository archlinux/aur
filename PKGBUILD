# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=0.0.3
pkgrel=1
pkgdesc="A composite font of IBM Plex Sans JP and Monaspace"
arch=(any)
url="https://github.com/yuru7/moralerspace"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/Moralerspace_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceHW_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceJPDOC_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceHWJPDOC_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/moralerspace/v$pkgver/LICENSE")
sha256sums=('00352f3c95ec2289b38a22a1afd1aede1ea96f31a24ce1091e4ccc127709d9e0'
            '9b4f438a9eec46db88ca41dcfc582a836c19599551a3b50248399aa7cfbb882d'
            'f6024fa4190a5cbd2f339be4693d2e06c95df8abc3d6d8372eb18e4185e9c835'
            'd10bdd818ac6a41c78d04a8221e5b306b8f7f02a37b4e4fa86aa6815f9470d11'
            '9d23767271951afeaddbe5de4dec5d1cb60456c06f45e4d04fbb9ab517d79e30')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Moralerspace_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceHW_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceHWJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
