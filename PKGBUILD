# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tnt-bin
pkgver=2022.02.21
pkgrel=1
pkgdesc="Tree analysis using New Technology. https://doi.org/10.1111/cla.12160"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/tnt/"
provides=('tnt')
license=('custom')
depends=(
	'tnt-ncurses5-compat-libs'
	)
source=("http://www.lillo.org.ar/phylogeny/tnt/tnt64-no-tax-limit.zip")
sha256sums=('58ef37e65279180136917a5f10b0ef6466e2e93311a1b4a6a0dd09ad4c4678a6')
package () {
	cd ${srcdir}
#	chmod +x tnt
	chmod +x xtnt
#	install -Dm 755 tnt ${pkgdir}/usr/bin/tnt
	install -Dm 755 xtnt ${pkgdir}/usr/bin/xtnt
	install -Dm 755 Tred.ttf ${pkgdir}/usr/share/fonts/Tred/Tred.ttf
	install -Dm 755 tnt.htm ${pkgdir}/usr/share/doc/tnt/tnt.htm
}
