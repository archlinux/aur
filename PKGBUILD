# Maintainer: yjun <jerrysteve1101@gmail.com>
pkgname=zhumu
pkgver=2.5.361956.0302
pkgdate=202003012
pkgrel=3
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=("x86_64" "i386")
url="https://www.zhumu.me"
license=('custom:zhumu')
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
source_x86_64=("http://downloads.zhumu.me/client/latest/linux/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('7d3f4a6795b2904e411dfb9b64de36d49c95513dc1ea96dbd8f0dcd2027174c9')
source_i386=("http://downloads.zhumu.me/client/latest/linux/${pkgname}_${pkgver}_i386.deb")
sha256sums_i386=('aa1eadcc6cde6ab7ece90d86ed19426dc538a8b1282b39bcfadfe868884ff804')
package(){
	cd ${srcdir}
	
	tar -xJf data.tar.xz -C ${pkgdir}
	
	#fix icon display
	sed -i 's/Icon=Zhumu.png/Icon=Zhumu/g' ${pkgdir}/usr/share/applications/Zhumu.desktop
}
