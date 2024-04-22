# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.12.0rc.4
pkgrel=3
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.12.0-rc.4/SlimeVR-amd64.deb")

sha512sums_x86_64=('456e692bcafe7d59bfbe608bbecda280dbd52729e9033cc79feb05ddd86dc275ecf0ff8968d5d5b2d007f9752644471934115f60733241f761ac3806d34d16db')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
