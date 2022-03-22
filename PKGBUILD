# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tnt-mpi-bin
_pkgname=mpitnt
pkgver=2022.02.21
pkgrel=1
pkgdesc="Tree analysis using New Technology. https://doi.org/10.1111/cla.12160"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/tnt/"
provides=('tnt')
conflicts=('tnt')
license=('custom')
depends=(
	'tnt-ncurses5-compat-libs'
	'openmpi'
	'cuda'
)
source=("http://www.lillo.org.ar/phylogeny/tnt/$_pkgname.zip")
sha256sums=('d570b4aaf3c198448e28b277495af33abcf7619cedbdc6a1dd7ec09d9db3dc7b')
package () {
	cd ${srcdir}
	chmod +x $_pkgname
	install -Dm 755 $_pkgname ${pkgdir}/usr/bin/tnt
#	install -Dm 755 xtnt ${pkgdir}/usr/bin/xtnt
	install -Dm 755 Tred.ttf ${pkgdir}/usr/share/fonts/Tred/Tred.ttf
	install -Dm 755 tnt.htm ${pkgdir}/usr/share/doc/tnt/tnt.htm
}
