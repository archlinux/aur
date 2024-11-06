 # Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.13.1.1
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.13.1/SlimeVR-amd64.deb")

sha512sums_x86_64=('86fcae8b5aef31d7ce3ecfe73dacdb9f7cd21b90ec2e02bb0592ec30e8b2071cf2cbe0e8736787bdb0182c8e9accec10004e4c2ba4c16678baf7cc5146f4eb74')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	rm "${startdir}/SlimeVR-amd64.deb"
}
