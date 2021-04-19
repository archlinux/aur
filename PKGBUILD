# Maintainer: Jhyub <seojanghyeob at gmail dot com>

pkgname='ttf-nexon-lv1-gothic'
pkgver=1
pkgrel=1
pkgdesc="NEXON Lv.1 GOTHIC TrueType Fonts"
arch=('any')
url="http://levelup.nexon.com/"
license=('custom:NEXON')
source=(
    "http://s.nx.com/s2/levelup/fontSite/files/Lv1Gothic/A_NEXON_Lv1_Gothic_OTF_TTF.zip"
    "LICENSE"
)
sha256sums=(
    '4a21a1fb4ad8f9c8d06c1f6c79e5fc3c4a6e3247356121dd67adc713ba3c2406'
    '81d0fc81e9a2a8b327d1749bace49c122b728c6000e46c72b4807895328d8585'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}/NEXON Lv1 Gothic_TTF"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
}
