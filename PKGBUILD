# Maintainer: Michal Ulianko <michal dot ulianko at gmail dot com>
pkgname=gnuarmeclipse-qemu-bin
pkgver=2.4.50
pkgrel=1
pkgdesc="Fork, Cortex-M cores support, better integration with the GNU ARM QEMU Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/qemu/"
license=('GPL')
provides=('gnuarmeclipse-qemu')
options=(!strip)
source_i686=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.4.50-20151029/gnuarmeclipse-qemu-debian32-2.4.50-201510290935-dev.tgz")
source_x86_64=("https://github.com/gnuarmeclipse/qemu/releases/download/gae-2.4.50-20151029/gnuarmeclipse-qemu-debian64-2.4.50-201510290935-dev.tgz")
md5sums_i686=('00fa757a9bd0f80ce897e6d546183b58')
md5sums_x86_64=('69588b16c19006275cb79aba7ee2c3f8')

package() {
	mkdir -p "$pkgdir/opt/gnuarmeclipse/qemu"
	cp -RPT -- "$srcdir/qemu/"*/ "$pkgdir/opt/gnuarmeclipse/qemu/"
}
