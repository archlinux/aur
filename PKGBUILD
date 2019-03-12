# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.5.14a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('nvidia-utils' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}_amd64.deb")
sha512sums_x86_64=('d3f8b8903d249f5218470bcdfe73651d3a13062007d9b8658c7c93c65ef89c15b189fd71b3475c8ccf90399850774987d577e8a2f7a356f09c3a3806b12ac42b')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config from 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
