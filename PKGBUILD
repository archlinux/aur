# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.12.0rc.3
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.12.0-rc.3/SlimeVR-amd64.deb")

sha512sums_x86_64=('8f83c59e92a10a9c8d040d005180201e44c82e51a56f888244e3b73d045f329386a24223166166a340bc964334c784815eb521c162544eec2aac58946c257f97')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
