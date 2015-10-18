# Maintainer: basica <aur basica at gmail dot com>

pkgname=qca9565-bluetooth-firmware
pkgver=1.144
pkgrel=1
pkgdesc="Qualcomm Atheros QCA9565 bluetooth firmware"
arch=('any')
url="https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi"
license=('atheros')
depends=()
makedepends=()
conflicts=()
provides=()
source=("https://launchpad.net/~hanipouspilot/+archive/ubuntu/rtlwifi/+files/linux-firmware_1.144%2Bar3012~vivid.tar.gz")
md5sums=('5b8524fd1f23985561b4df2a2a5130f7')

package() {
	mkdir -p $pkgdir/usr/lib/firmware/ar3k
	cp $srcdir/linux-firmware-1.144+ar3012~vivid/ar3k/AthrBT_0x31010100.dfu $pkgdir/usr/lib/firmware/ar3k
	cp $srcdir/linux-firmware-1.144+ar3012~vivid/ar3k/ramps_0x31010100_40.dfu  $pkgdir/usr/lib/firmware/ar3k
	chmod 644 $pkgdir/usr/lib/firmware/ar3k/*
}