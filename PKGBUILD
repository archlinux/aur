# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-qemu-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Fork, Cortex-M cores support, better integration with the GNU ARM QEMU Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/qemu/"
license=('GPL')
provides=('gnuarmeclipse-qemu')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.6.0-20160728/gnuarmeclipse-qemu-debian32-2.6.0-201607280535.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.6.0-20160728/gnuarmeclipse-qemu-debian64-2.6.0-201607280535.tgz")
md5sums_i686=('e17d1076b2ee7d98521dd8b719000bb8')
md5sums_x86_64=('bde0a0d5cdd0104dff50711b138e25ff')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/qemu"
	cp -RPT -- "$srcdir/qemu/"*/ "$pkgdir/opt/gnuarmeclipse/qemu/"
}
