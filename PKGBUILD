# Maintainer: Jhyub <seojanghyeob at gmail dot com>

pkgname='ttf-nexon'
pkgver=5
pkgrel=1
pkgdesc="The Level Up series TrueType fonts provided by Nexon."
arch=('any')
url="http://levelup.nexon.com/"
license=('custom:NEXON')
source=(
    "http://s.nx.com/s2/levelup/fontSite/files/Lv1Gothic/A_NEXON_Lv1_Gothic_OTF_TTF.zip"
    "http://s.nx.com/s2/levelup/fontSite/files/Lv2Gothic_ver200609/NEXON_Lv2_Gothic.zip"
    "http://s.nx.com/s2/levelup/fontSite/files/BazziFont/A_BAZZI_Font.zip"
    "http://s.nx.com/s2/levelup/fontSite/files/MaplestoryFont/MaplestoryFont_TTF.zip"
    "LICENSE"
)
sha256sums=(
    '4a21a1fb4ad8f9c8d06c1f6c79e5fc3c4a6e3247356121dd67adc713ba3c2406'
    '5355f49bf63c4f49f2ee2294b2e2eba0c7bdafc15655f4fae8e12e5c2e1b52d2'
    '113249e129b6daf5aff1abc9adc07ae6f9b4381635fb5b6b9df30ce4e6f60334'
    '4aaa464d6d7a31d3f3d23dddeefada69064300087b5ea5ebc575952594b5755a'
    '81d0fc81e9a2a8b327d1749bace49c122b728c6000e46c72b4807895328d8585'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}/NEXON Lv1 Gothic_TTF"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}/NEXON_Lv2_Gothic"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
}
