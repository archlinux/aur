# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tnt-gui
pkgver=1.5
pkgrel=1
pkgdesc="Tree analysis using New Technology"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/tnt/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://www.lillo.org.ar/phylogeny/tnt/tnt-win-no-tax-limit.zip" "tnt.desktop" "tnt.png")
sha256sums=('e3732debc569207320fc39468063eb19b6e6055c10c1d1dd9a646ebff620e4a8'
            '963042eaff0fe25ecb25d8d1d3ad227542a8c085124a80f5437505e4871d2661'
            '292f95bbcb47bea8eae753123df282e19bc1461a0d0f7c0312e3864656b77da3')

package() {
	install -Dm755 ${srcdir}/tnt.exe ${pkgdir}/usr/share/tnt/tnt.exe
	install -D -m 755 ${srcdir}/*.htm "${pkgdir}/usr/share/tnt/"
	install -Dm755 ${srcdir}/tnt_scripts.zip ${pkgdir}/usr/share/tnt/tnt_scripts.zip
	install -Dm755 ${srcdir}/Tred.ttf ${pkgdir}/usr/share/tnt/Tred.ttf
	
	install -Dm755 ${srcdir}/tnt.png ${pkgdir}/usr/share/tnt/tnt.png
	install -Dm755 ${srcdir}/tnt.desktop ${pkgdir}/usr/share/applications/tnt.desktop
}
