# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.4.4a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('nvidia-utils' 'ncurses' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}_amd64.deb")
sha512sums_x86_64=('605d6dd0ea1752105471b0eed12e273339b890606b3ca3694037449b12184e24bfafce5f609fa8e1d64cab69509b4847076fab037d2e8a4b8ea502e1547a2a6f')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config at 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You now can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
