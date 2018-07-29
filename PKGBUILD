# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.5.10a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('chef-dk' 'nvidia-utils' 'ncurses' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}_amd64.deb")
sha512sums_x86_64=('941d645d36ecd960f9b54538a0037fd7572e90f7cbe30a29110bee46ae0bf5a81183dfc168724334c10a1fa556c88a87c6ae6806f3cacca004224495008a15a7')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config from 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You now can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
