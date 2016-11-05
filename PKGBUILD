# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-openocd-bin
pkgver=0.10.0_201610281609
pkgrel=1
pkgdesc="Fork, better integration with the GNU ARM OpenOCD Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/openocd/"
license=('GPL')
provides=('gnuarmeclipse-openocd')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20161028/gnuarmeclipse-openocd-debian32-0.10.0-201610281609-dev.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20161028/gnuarmeclipse-openocd-debian64-0.10.0-201610281609-dev.tgz")
md5sums_i686=('c13c87a00741b3664dd703eb6729f610')
md5sums_x86_64=('6a09bae777f1b940d4bf38eed34b5075')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/openocd"
	cp -RPT -- "$srcdir/openocd/"*/ "$pkgdir/opt/gnuarmeclipse/openocd/"
}
