# Maintainer: Directum.ru
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

# IMPORTANT: You must download the WebAccessAgent.deb from our App Server DirectumRX
# and place it in the directory with this PKGBUILD.
# Don't forget fix checksum for .deb file

pkgname=webaccessagent
pkgver=6.0.3
pkgrel=1
pkgdesc="DIRECTUM Web Access Agent"
arch=('x86_64')
url="http://www.directum.ru"
license=('DIRECTUM License')
options=('!strip' '!emptydirs')
depends=(dbus fontconfig freetype2 gcc-libs glib2 glibc libdrm libglvnd libx11 libxcb libxcomposite libxext libxrender nspr nss openssl-1.1 pcsclite qt5-base qt5-declarative qt5-wayland qt5-websockets wayland zlib tcl tk)
source=("local://WebAccessAgent.deb")
sha512sums=('e33c9b2c95d3f69b124b1c2cb97f98fdcfffea7ac0560d16b0cca34d03c0a273969680c82a96563b9ab944060dd7a979c76a407d14c233b79be10bf26d4bc6fa')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
