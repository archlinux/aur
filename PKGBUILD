# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-moralerspace
pkgver=0.0.5
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
sha256sums=('067a08866c788db0ba9133ba139d2eb3750f6f2253a43bdd0e3418f57e0d9c10'
            'e9c601843bec772cf06eed9498461acbeee65150c48ba0129c5d37e755da0c4f'
            '9ce68546ad71d4663b28d9fff7c55458fb469fd29108d85b82a34c5f6085c503'
            '3946df3f09f688cbf08574cc5ec360e14f003123324d29814bcf96d0b2d9496a'
            'bf464239a28af7aa9a0da32f4554cac59a24b7bebfe57cac02a6d9e5a459484d'
            'c10d84a715bebc56795186557c1fe772b6a8cc6c9ea701ad43a7e649c5a7c51b'
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
