# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tnt-gui
pkgver=2022.10.05
pkgrel=1
pkgdesc="Tree analysis using New Technology. https://doi.org/10.1111/cla.12160"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/tnt/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("http://www.lillo.org.ar/phylogeny/tnt/tnt-win-no-tax-limit.zip" "tnt-gui.desktop" "tnt.png")
sha256sums=('8d2a24789f64af85954d9cca65b6543301c7d40302648e3e86cc99e41fa079c5'
            '52bb9fbbedafd5456a7ad6515ca79caabd5b5a39edc79234107899da55ddedfc'
            '292f95bbcb47bea8eae753123df282e19bc1461a0d0f7c0312e3864656b77da3')

package() {
	mkdir -p $pkgdir/usr/share/tnt-gui
	install -Dm755 ${srcdir}/tnt.exe ${pkgdir}/usr/share/tnt-gui/tnt.exe
#	install -Dm755 ${srcdir}/tnt.htm "${pkgdir}/usr/share/tnt-gui"
#	install -Dm755 ${srcdir}/tnt_scripts.zip ${pkgdir}/usr/share/tnt-gui/tnt_scripts.zip
#	install -Dm755 ${srcdir}/Tred.ttf ${pkgdir}/usr/share/tnt-gui/Tred.ttf
	
	install -Dm755 ${srcdir}/tnt.png ${pkgdir}/usr/share/tnt-gui/tnt.png
	install -Dm755 ${srcdir}/tnt-gui.desktop ${pkgdir}/usr/share/applications/tnt-gui.desktop
}
