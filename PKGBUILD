# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=2.6.0+b997b0f
pkgrel=1
pkgdesc="This package contains the Mongoose OS - IoT Firmware Development Framework."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.6.0+b997b0f~bionic0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.6.0+b997b0f~bionic0_amd64.deb")
sha512sums_x86_64=('2236022a4f26ff043c157ac01e86a4d282ffc6810a4689c1fe9e7a5af3a3d9b3e725e7064b5e95e29b2cfc7ea268e6da9edea99c5245e100e6cb669da0c1d544')
sha512sums_i686=('e595bc405f34c69331c4501b2f1959160a110c734f50d192d81d31a39b8d63f5d164727d29fe0df89cd8fc8b13ef290fca10c72140330d01d62f837a9970c4e0')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
