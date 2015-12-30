# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-openocd-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Fork, better integration with the GNU ARM OpenOCD Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/openocd/"
license=('GPL')
provides=('gnuarmeclipse-openocd')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20151028/gnuarmeclipse-openocd-debian32-0.10.0-201510281129-dev.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20151028/gnuarmeclipse-openocd-debian64-0.10.0-201510281129-dev.tgz")
md5sums_i686=('6d4bb44d4218c0d5ecc1910ce3983162')
md5sums_x86_64=('c40683089d471b24347134b756f4984f')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/openocd"
	cp -RPT -- "$srcdir/openocd/"*/ "$pkgdir/opt/gnuarmeclipse/openocd/"
}
