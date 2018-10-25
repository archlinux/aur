# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.5.13a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('nvidia-utils' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}-cuda10_amd64.deb")
sha512sums_x86_64=('c3d4d0d82bbe6d3488c7e092f012ae6e8b0ae202161659ccc53328b672fdff7f29f8864daafde041d8420288f9a96fa5f032badab0a54e5e8030793b4b3b747b')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config from 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You now can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
