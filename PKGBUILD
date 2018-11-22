# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=2.8.1+0fc1db0
pkgrel=1
pkgdesc="This package contains the Mongoose OS - IoT Firmware Development Framework."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+build/15669836/+files/mos_2.8.1+0fc1db0~bionic0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+build/15669833/+files/mos_2.8.1+0fc1db0~bionic0_amd64.deb")
sha512sums_x86_64=('9c7bf4e8d81fe94816db258ec03c2cdce5d87b928b78cdaf0a008a24a80f6d9f00723dea3aad600a3822dd273f119272ad87c8d4cc7b2b1e61d12db18018189a')
sha512sums_i686=('1504e3321024b43b50aa750c9d3d5cfd1a2c4d79e55655f9366629c744a7614f7702424b2b2a087ee529eb1d607185f638f6edd619c21a0660640f43b153766c')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
