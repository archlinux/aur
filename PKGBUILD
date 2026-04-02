# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Contributor: pezcurrel <pezcurrel [at] tiscali.it>

pkgname=x2vnc-bin
pkgver=1.7.2
pkgrel=1
pkgdesc='Lets you use a monitor on a different computer running a VNC server as if it was connected to the computer you are using.'
arch=('x86_64')
url='https://fredrik.hubbe.net/x2vnc.html'
license=('GPL')
conflicts=('x2vnc-xinerama')
depends=('libxss' 'libxinerama' 'libx11' 'glibc' 'libxext' 'libxcb' 'libxau' 'libxdmcp')
source=('http://ftp.us.debian.org/debian/pool/main/x/x2vnc/x2vnc_1.7.2+git20100909.01ced3d-1_amd64.deb')
sha512sums=('b99bf3482a59bc123652b894967b226be2c9f914dd5acd222eae2de72837511b9abd985c1fd9f7d686c827b97d40b14f5a84f427a3feb7ec35238b13dff69dc2')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}
