# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=2.3+7ca03a2
pkgrel=1
pkgdesc="This package contains the Mongoose OS - IoT Firmware Development Framework."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.3+7ca03a2~bionic0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.3+7ca03a2~bionic0_amd64.deb")
sha512sums_x86_64=('8e07d3d80a4ffc21e241839c493ad1f801b388f89b850bcb33b333ee58c01c7961029c2e9dd1f91ef32529d156c0110e0de676d9aa83db069430623bc9c36fff')
sha512sums_i686=('7375177db2f9429dea2d1063ccc1b3c497d92d3fff08d26524f47d19ee7a0062c1a1526459a4b7ab429e1f36aaa646c0379e1049b708f0313445c3cfc03d7fea')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
