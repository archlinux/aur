# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-openocd-bin
pkgver=0.10.0_201601101000_dev
pkgrel=1
pkgdesc="Fork, better integration with the GNU ARM OpenOCD Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/openocd/"
license=('GPL')
provides=('gnuarmeclipse-openocd')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20160110/gnuarmeclipse-openocd-debian32-0.10.0-201601101000-dev.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20160110/gnuarmeclipse-openocd-debian64-0.10.0-201601101000-dev.tgz")
md5sums_i686=('4ca0dd6d9c9ad24af2aa4eddec7717e1')
md5sums_x86_64=('3ac38e2ac8b71a8ede734a271f0765de')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/openocd"
	cp -RPT -- "$srcdir/openocd/"*/ "$pkgdir/opt/gnuarmeclipse/openocd/"
}
