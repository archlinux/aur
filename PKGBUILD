# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=1.0.1
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
sha256sums=('77568a436c0664ba37c5f94dcb379dce0693da2ca65b1ba7d12d049f3f1c9c80'
            '5bfa37ed643b5f8695a42eb11d283afe097002f7538e22249e8ee23c5e11b714'
            '167f3a7ab0705d1384805fd7b7d25f285b0f42a74791aa82c7e89014314693e4'
            'c7d8b2f3d0acb75817eeaab79232d2f8cd4ec8a3c5ed38a1ac9f4601e59391d9'
            'fc480afbd1427889097cd282d40c42986bdc45690cf959c6fae28496c4b5782d'
            '0f60db2d6ed6db719e5ab63e243a9bfd7b3ed30a0f0c135dd9cf8bc2856d6269'
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
