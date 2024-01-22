# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=treemap
pkgver=3b1243
pkgrel=7
pkgdesc="a tool for analysing relationships between evolutionary histories of ecologically linked species"
arch=('x86_64')
url="https://sites.google.com/site/cophylogeny/treemap/"
license=('custom')
noextract=("TreeMap${pkgver}.jar")
source=("treemap.desktop" "treemap.png" "https://sites.google.com/site/cophylogeny/software/TreeMap${pkgver}.jar")
sha256sums=('dd308f7e4596edef57be9bbbfc7a7088a27f75763feae02e446c9d16518940e5'
            '514cbfcb94803808141cc6fae9b58eabfe58ba7a55d5d5f3f1061cd7a154b28e'
            'e3b6ea0c31b7ced23e19f88b88ca5ae4a47469374ff95ae3b9c06c167409c8c8')
depends=(
    'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{treemap,icons,applications}
    install -Dm644 ${srcdir}/TreeMap${pkgver}.jar ${pkgdir}/usr/share/treemap/TreeMap.jar
    install -Dm 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -Dm 755 ${srcdir}/*.png ${pkgdir}/usr/share/icons
}
