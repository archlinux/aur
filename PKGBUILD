# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.13.0.rc4
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.13.0-rc.4/SlimeVR-amd64.deb")

sha512sums_x86_64=('15d525e6cd568bbf0f2d13817e6dab96ff4e7121b25b4d01d687d9e527dd1d2c36b942807e99ff73d4eafaff212b63b3b8ad9328ff5c6571b558d3a0065246e2')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	rm "${startdir}/SlimeVR-amd64.deb"
}
