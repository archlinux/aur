# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=treemap
pkgver=3b1243
pkgrel=6
pkgdesc="a tool for analysing relationships between evolutionary histories of ecologically linked species"
arch=('x86_64')
url="https://sites.google.com/site/cophylogeny/treemap/"
license=('custom')
noextract=("TreeMap${pkgver}.jar")
source=("treemap.desktop" "treemap.png" "https://sites.google.com/site/cophylogeny/software/TreeMap${pkgver}.jar")
sha256sums=('dd308f7e4596edef57be9bbbfc7a7088a27f75763feae02e446c9d16518940e5'
            '514cbfcb94803808141cc6fae9b58eabfe58ba7a55d5d5f3f1061cd7a154b28e'
            '0a7d83728a6e17dd157cdef79f7040e611d9d2a22d86a039672f070d1eee80e0')
depends=(
    'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{treemap,icons,applications}
    install -Dm644 ${srcdir}/TreeMap${pkgver}.jar ${pkgdir}/usr/share/treemap/TreeMap.jar
    install -Dm 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -Dm 755 ${srcdir}/*.png ${pkgdir}/usr/share/icons
}
