 # Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.13.1.rc2
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=( 'x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jdk-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.13.1-rc.2/SlimeVR-amd64.deb")

sha512sums_x86_64=('b855da3ba8388aa00ad2e19445fc803e7ae22dd9534e414b9da86cc697781604809e8c25e760bfef9db82ddf2dc0d76694af214ef81601ffd6bf6a0e676bfbdc')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	rm "${startdir}/SlimeVR-amd64.deb"
}
