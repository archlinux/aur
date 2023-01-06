# Maintainer: Jhyub <seojanghyeob at gmail dot com>

pkgname='otf-nexon-football-gothic'
pkgver=5
pkgrel=2
pkgdesc="The NEXON FOOTBALL GOTHIC OpenType font provided by Nexon."
arch=('any')
url="http://levelup.nexon.com/"
license=('custom:NEXON')
source=(
    "http://s.nexon.com/s2/levelup/fontSite/files/FootballGothic/NexonFootballGothic_all_mac.zip"
    "LICENSE"
)
sha256sums=(
    '426d037be559425bc79d2c02372a7c8a28a9012d85d72970ebfaa095ffc7c79e'
    '81d0fc81e9a2a8b327d1749bace49c122b728c6000e46c72b4807895328d8585'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${srcdir}"/*.otf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
}
