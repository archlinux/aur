# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
pkgver=1.5.2a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('aarch64-linux-gnu-glibc>=2.14' 'chef-dk' 'nvidia-utils' 'ncurses' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/v${pkgver}/excavator_${pkgver}_amd64.deb")
sha512sums_x86_64=('fb6893b3cbca10f16cbd8788e41323abec1c81cc5382f3ffffedb9e82b47ff5ef573f7b0d44cf14b85863e36a1caf1be2afbd1d6fc7e2381d8b8d0f9a4809333')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	msg2 "You should grab yourself a config at 'https://github.com/nicehash/excavator/blob/master/default_command_file.json'"
	msg2 "You now can run excavator by specifying the path to the command file (excavator -c /tmp/default_command_file.json)"
}
