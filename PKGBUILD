# Maintainer: kfish610 <kfish610@gmail.com>
pkgname=pros-core-bin
pkgver=2.6.1.0
pkgrel=1
pkgdesc="PROS core components, including the CLI and Arm Toolchain."
arch=('x86_64')
url="https://github.com/purduesigbots/pros"
license=('MPL2')
depends=('arm-none-eabi-gcc' 'arm-none-eabi-newlib')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/purduesigbots/pros/releases/download/2.12.2/pros-core-2.6.1-amd64.deb")
sha512sums_x86_64=('e8a27efe01be0224872c0a83ed74289e527ee0a907c887ca6e304478b33195f21c951e04cc55e36316ff2271a7473adfc40b6265efe99d23e8e4373bd0d2bd8f')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
