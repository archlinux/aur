# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=1.0.2
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
sha256sums=('edafef240510a47f8fd34bfcb78fb05badf795cd0cef03766c9e58c3faf6ef83'
            '06dbd8f2bdd5259d07e43e9fd5601f6a62f80a69813cab1801c9e9dc499c71ce'
            '0c22320b9466d5cfb9e66c9ecba1bef6a71afe2a5890e81927efd78ba721261e'
            'd3c7288f071288e5edadb049211b76b42b7214b5c1a3d43e49848dad9c319b78'
            'dcdccaf2620422e63f00f39589afc5b5052fe62d8fa6ec1a8c244da3e6982868'
            'f2e7a6ea84135157fadebba74120350903308a84b4fa53a6193ad3c4282b9596'
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
