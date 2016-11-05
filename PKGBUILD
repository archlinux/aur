# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-qemu-bin
pkgver=2.7.0_201610290751
pkgrel=1
pkgdesc="Fork, Cortex-M cores support, better integration with the GNU ARM QEMU Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/qemu/"
license=('GPL')
provides=('gnuarmeclipse-qemu')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.7.0-20161029/gnuarmeclipse-qemu-debian32-2.7.0-201610290751.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.7.0-20161029/gnuarmeclipse-qemu-debian64-2.7.0-201610290751.tgz")
md5sums_i686=('b09312cbf97a6907cc618b5ae367232d')
md5sums_x86_64=('33f834fc81cebfcee74ff7f1c7b6a3b7')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/qemu"
	cp -RPT -- "$srcdir/qemu/"*/ "$pkgdir/opt/gnuarmeclipse/qemu/"
}
