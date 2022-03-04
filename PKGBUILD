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
	'nona'
)
source=("http://www.lillo.org.ar/phylogeny/winclada/winclad.zip" "winclada.desktop" "winclada.png")
sha256sums=('79a224ec2a4fd4a6089380cae37e5e10f8563299f4df37d8032a055951e0cf0b'
            '09b52775bc0ee2693e586f2603b44977278269fd671be5fac7db1621f4c88a8b'
            '3308a84fdc339350dde47a03ad502ca6d8a6d573bb3e5695c0c964ba72761279')

package() {
	install -Dm755 ${srcdir}/winclad.exe ${pkgdir}/usr/share/winclada/Winclada.exe
	install -Dm755 ${srcdir}/winclada.png ${pkgdir}/usr/share/winclada/winclada.png
	install -Dm755 ${srcdir}/winclada.desktop ${pkgdir}/usr/share/applications/winclada.desktop
}
