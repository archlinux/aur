# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=latest_201805141730+1b49b7f
pkgrel=1
pkgdesc="This package contains the Mongoose OS CLI tool."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201805141730+1b49b7f~xenial0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos-latest_201805141730+1b49b7f~xenial0_amd64.deb")
sha512sums_x86_64=('51266fcdf291fafc2d17233c3c54d8ab4fbf2f4092081da70a1df1b05934e0d6d023ebdb675e54e6920471db3b66ed3ded7337be748822654aac4bdc00f2f418')
sha512sums_i686=('844560ab22431f4e04e5a9c21b4598aab912e41a39dfa4ccf27b31559a0dd6cb3b280f48cfc336fa33a55c87de8a6c3199a0f3b51a6d9a76ec62fc769837a67a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
