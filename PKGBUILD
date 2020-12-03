# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=nxp-blhost-sdphost
pkgver=1.0
pkgrel=1
pkgdesc="NXP blhost and sdphost boot loading tools"
url='https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuboot-mcu-bootloader-for-nxp-microcontrollers:MCUBOOT'
arch=('armv7h' 'x86_64')
source=('git+https://github.com/apexrtos/nxp_blhost_sdphost.git')
md5sums=('SKIP')

package() {
	cd $srcdir/nxp_blhost_sdphost
	make
	install -d ${pkgdir}/usr/bin
	install -m 0755 blhost ${pkgdir}/usr/bin
	install -m 0755 sdphost ${pkgdir}/usr/bin
}
