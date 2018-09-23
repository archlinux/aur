# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.5.11a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('chef-dk' 'nvidia-utils' 'ncurses' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}_amd64.deb")
sha512sums_x86_64=('a6bfd29e27ca4f4aa833716747fa8cd0218e66deefb922afd6fe9878a9a14d87975386d8e6dadfb57d0234b741a192ffa14a6c15a3ae33aea9993f15b1444d88')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config from 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You now can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
