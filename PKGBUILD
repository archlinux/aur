# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=1.0.0
pkgrel=1
pkgdesc="A composite font of IBM Plex Sans JP and Monaspace"
arch=(any)
url="https://github.com/yuru7/moralerspace"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/Moralerspace_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceJPDOC_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceHW_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceHWNF_v$pkgver.zip"
        "$url/releases/download/v$pkgver/MoralerspaceHWJPDOC_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/moralerspace/v$pkgver/LICENSE")
sha256sums=('8a6b4a011be5757b0e471f21af021e142259d9f23f13e34e9e3ecf179d37624f'
            '5c0c20abd39cb4f09da16cc30f5d74c8e95ffc86a21baeb9d2672aafdf2097a4'
            '093405c15a7bd41aa17e21744a8b3716e04b8c6559d69fdf393f73434793dad5'
            '32cdbc021a08b278bb8a9319b531556fb6ed6230e7481138d65a1c5a8a3a1acb'
            '0b9f5d85cb50452a91fcc1a16d037d01089511d919962a3213926917689cc0e8'
            '7693ea9ee7e427252f1aa6c4e5cdeaf5aad624e9674ec1c33bc89fe7d393f595'
            '9d23767271951afeaddbe5de4dec5d1cb60456c06f45e4d04fbb9ab517d79e30')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Moralerspace_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceHW_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceHWNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 MoralerspaceHWJPDOC_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
