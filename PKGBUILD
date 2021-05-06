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
sha256sums=('2adaad6de1d334817a947dd4b210b9c0908506e865d9625869c13e968b8a5e63'
            'fb3843fe28e3083530888e337694fcc2654652647f86223194f241c70342d7a7'
            '292f95bbcb47bea8eae753123df282e19bc1461a0d0f7c0312e3864656b77da3')

package() {
	install -Dm755 ${srcdir}/tnt.exe ${pkgdir}/usr/share/tnt/tnt.exe
	install -D -m 755 ${srcdir}/*.htm "${pkgdir}/usr/share/tnt/"
	install -Dm755 ${srcdir}/tnt_scripts.zip ${pkgdir}/usr/share/tnt/tnt_scripts.zip
	install -Dm755 ${srcdir}/Tred.ttf ${pkgdir}/usr/share/tnt/Tred.ttf
	
	install -Dm755 ${srcdir}/tnt.png ${pkgdir}/usr/share/tnt/tnt.png
	install -Dm755 ${srcdir}/tnt.desktop ${pkgdir}/usr/share/applications/tnt.desktop
}
