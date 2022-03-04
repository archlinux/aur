# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=winclada
pkgver=2.0
pkgrel=1
pkgdesc="Winclada‐ASADO"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/winclada/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://www.lillo.org.ar/phylogeny/winclada/winclad.zip" "winclada.desktop" "winclada.png" "autodada.dad" "nona.exe")
sha256sums=('79a224ec2a4fd4a6089380cae37e5e10f8563299f4df37d8032a055951e0cf0b'
            '09b52775bc0ee2693e586f2603b44977278269fd671be5fac7db1621f4c88a8b'
            '3308a84fdc339350dde47a03ad502ca6d8a6d573bb3e5695c0c964ba72761279'
            'f202661a399d9b81a1db347392ea79295bac6ccfae61e9c5e39d0aad2405bf1b'
            '786631e42427bcec3384c9f8285e24a4581db935967bb21db7f02c8b07ad20d2')

package() {
	install -Dm755 ${srcdir}/winclad.exe ${pkgdir}/usr/share/winclada/Winclada.exe
	install -Dm755 ${srcdir}/nona.exe ${pkgdir}/usr/share/winclada/nona.exe
	install -Dm755 ${srcdir}/autodada.dad ${pkgdir}/usr/share/winclada/autodada.dad
	install -Dm755 ${srcdir}/winclada.png ${pkgdir}/usr/share/winclada/winclada.png
	install -Dm755 ${srcdir}/winclada.desktop ${pkgdir}/usr/share/applications/winclada.desktop
}
