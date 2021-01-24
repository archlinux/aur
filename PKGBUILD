# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
pkgname=steamlink-raspberrypi
pkgver=1.0.8
pkgrel=1
pkgdesc="Steam Link app for RPi"
arch=('armv7h')
url="https://store.steampowered.com/steamlink/about"
license=('custom')
depends=('libjpeg6-turbo' 'libcec-rpi' 'curl' 'gnupg' 'xz' 'zenity')
source=("http://media.steampowered.com/steamlink/rpi/steamlink.deb")
sha256sums=('1bdbae24838043e5803e257979508d41d8c933b14cea7889aa59d55f4246108e')

package() {
	tar -xvf data.tar.xz -C ${pkgdir}
	rm ${pkgdir}/usr/bin/steamlinkdeps	
}
