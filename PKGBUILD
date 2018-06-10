# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=201805251107+b3a2294
pkgrel=1
pkgdesc="This package contains the Mongoose OS - IoT Firmware Development Framework."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201805251107+b3a2294~xenial0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201805251107+b3a2294~xenial0_amd64.deb")
sha512sums_x86_64=('e58366658acad52fc987ec33ee60517534ed0afea4634dbaf14b5a8db7668213d4570e73a2190170ed910152183a174413d7e6418db5093423c8aa938b4fe236')
sha512sums_i686=('e758e6457da982cd2efc5f7acb26a76bbd51d5fba5b3eb3a6688d378820c79c0b478dcfcb36d038a1a22d01d7737cdcf0fc783af94f060cc2e56c6ac731f2386')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
