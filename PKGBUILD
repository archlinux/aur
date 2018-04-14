# Maintainer: Hamza BENDALI BRAHAM <hbendali@ya.ru>
# Contributor: Hamza BENDALI BRAHAM <hbendali@ya.ru>
pkgname=mongoose-os
pkgver=2.0+4ed5853
pkgrel=2
pkgdesc="This package contains the Mongoose OS CLI tool."
arch=('x86_64' 'i686')
url="https://mongoose-os.com"
license=('Apache 2.0')
groups=('')
depends=('libftdi-compat' 'libusb>=1.0.16')
options=('!strip' '!emptydirs')
source_i686=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.0+4ed5853~xenial0_i386.deb")
source_x86_64=("https://launchpad.net/~mongoose-os/+archive/ubuntu/mos/+files/mos_2.0+4ed5853~xenial0_amd64.deb")
sha512sums_i686=('d41726ec40d046f655cc44f6300668543e222476b5e8fb088b00c9b92717f6af3a221b12034cb49f952bf7cce60f45f61bc3135023aec45c83b0effc1f91eeb1')
sha512sums_x86_64=('1d22e47054e49cd4ff9e90573afc17d98b9c56771dddc979968e57e0c14a8ec62bed483bf9ad67893aeae01d09853c3a3ab1253e06f666b15adf3e4f87158d4a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}