# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=0.0.11
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
sha256sums=('359dd7e97dcfe21a455e7e9236a3771a80aa73f107eada8613683ed7c38f78e6'
            '39d419c8da532665e77a85a7712638eacd3712f8e763185fd0942823d719b0e0'
            '87668a1acbc69a3fe0a6d1f5f60fc0657953b70b6f40a74795d37364740cc284'
            '5a00c8390bb4c23c692daa12b8a4a7ccfed09c63f405e06b6231d4f9bc649773'
            '50582ec70fa1fe7d8ad77ef0c4c7be078fbdd73a0f4f66157dd44e3ee6618317'
            '517edb350f05832a9dcb0eec335a6856ebe91c87a52dd099040796d0f90b3f90'
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
