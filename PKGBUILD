# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=open-delta
pkgver=1.02
pkgrel=1
pkgdesc="DEscription Language of TAxonomy"
arch=('x86_64')
url="https://github.com/AtlasOfLivingAustralia/open-delta"
license=('unknown')
source=("https://github.com/AtlasOfLivingAustralia/open-delta/files/4686516/open-delta-1.02-bin.zip" "open-delta.desktop" "delta.gif")
sha256sums=('f3e2cd3d6abb572e2e856e624a574b100592da40c7c6639a9dd28abcc5e5c993'
            '1f5b65a87a3778ec40f40643c937ea6be99474aa3185ead67551f8ee83146fe6'
            '583b2666eb51f488aefe27caf870961478fcdd9272304d667d83631fe62e8e0f')
depends=(
	'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{${pkgname},applications} 
    mv ${srcdir}/open-delta-${pkgver}/* ${pkgdir}/usr/share/${pkgname}
    install -m 755 ${srcdir}/delta.gif  ${pkgdir}/usr/share/${pkgname}/delta.gif
    install -m 755 ${srcdir}/delta.desktop ${pkgdir}/usr/share/applications/delta.desktop
}
