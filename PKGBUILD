# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=winclada
pkgver=1.6.1
pkgrel=1
pkgdesc="Winclada‐ASADO"
arch=('x86_64')
url="http://www.diversityoflife.org/winclada/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://www.diversityoflife.org/winclada/Winclad.exe" "winclada.desktop" "winclada.png")
sha256sums=('4c6647c3ca56a57a74ab508feb71755f0ffdf7204b148e326397953ac8d32a6b'
            '4f34fe26e34394678de2441226a376d0b350fbd905803f7b1cb355fd4cd17153'
            '3308a84fdc339350dde47a03ad502ca6d8a6d573bb3e5695c0c964ba72761279')

package() {
	install -Dm755 ${srcdir}/Winclad.exe ${pkgdir}/usr/share/winclada/Winclada.exe
	install -Dm755 ${srcdir}/winclada.png ${pkgdir}/usr/share/winclada/winclada.png
	install -Dm755 ${srcdir}/winclada.desktop ${pkgdir}/usr/share/applications/winclada.desktop
}
