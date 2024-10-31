 # Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.13.1.rc3
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.13.1-rc.3/SlimeVR-amd64.deb")

sha512sums_x86_64=('519662a0678ca970f2f52cfc6b4a89764182d4cba8c8ca296a31f2294c71430d8db13d2e699914e8dc643ddcdbd402f97d196be0c9daea98792715110062af0c')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	rm "${startdir}/SlimeVR-amd64.deb"
}
