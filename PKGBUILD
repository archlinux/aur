# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.13.0.rc2
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.13.0-rc.2/SlimeVR-amd64.deb")

sha512sums_x86_64=('4fb6e1b681434eefd07a29c641cbc768b57ea61d19bbc2a9a28804985bc80bca143ae2a92eb597ee02f03a138305649c33acc6464974d667844e6d32ff560ff6')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	rm "${startdir}/SlimeVR-amd64.deb"
}
