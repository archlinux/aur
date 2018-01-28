# Maintainer: TheGoliath
pkgname=excavator
pkgrel=1
_pkggit=1.4.1a-xenial0
pkgver=v1.4.1a
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=('x86_64')
url="https://github.com/nicehash/excavator"
license=('https://github.com/nicehash/excavator/blob/master/excavator-EULA.txt')
groups=('')
depends=('nvidia-utils' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ncurses' 'ocl-icd>=1.0')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nicehash/excavator/releases/download/${pkgver}/excavator_${_pkggit}_amd64.deb")
sha512sums_x86_64=('d2e121811b24974140b6534ec2d4e94fc02927ed6c6c03ff08a631b3979003750dad59b3fa89fd83c9a75323dbe1807b08373f074c81ee21a473d6f58e51f985')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "/usr/share/doc/excavator/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
