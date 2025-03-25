# Maintainer: Directum.ru
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

# IMPORTANT: You must download the WebAccessAgent.deb from our App Server DirectumRX
# and place it in the directory with this PKGBUILD.
# Don't forget fix checksum for .deb file

pkgname=webaccessagent
pkgver=6.0.1
pkgrel=1
pkgdesc="DIRECTUM Web Access Agent"
arch=('x86_64')
url="http://www.directum.ru"
license=('DIRECTUM License')
options=('!strip' '!emptydirs')
depends=(dbus fontconfig freetype2 gcc-libs glib2 glibc libdrm libglvnd libx11 libxcb libxcomposite libxext libxrender nspr nss openssl-1.1 pcsclite qt5-base qt5-declarative qt5-wayland qt5-websockets wayland zlib)
source=("local://WebAccessAgent.deb")
sha512sums=('12ff87cf68d523de40ee6b37a52e3181f22e3be830d209b9858c4f0440db0b14b48b64d081b4ad2a93572b34ee34cccdf1b2507100128903714996b626b395bd')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
