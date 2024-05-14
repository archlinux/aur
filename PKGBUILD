# Maintainer: XSilverTH <XSilverTH AT outlook DOT com>

pkgname=liquidlauncher-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft. A LiquidBounce hacked-client launcher for the game Minecraft"
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('dedef9aa7792b2659d2416c1fb9a680ccad70cea93988e114bbad2b2a408657d01500b7d339aaa27ccb8b9fe21e18d1f670acb1750c263ac9c61f7bdfd49dc8e')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
