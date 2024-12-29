# Maintainer: Izuna <1zuna AT ccbluex DOT net>
# Previous Maintainer: XSilverTH <XSilverTH AT proton DOT me>

pkgname=liquidlauncher-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft. A LiquidBounce hacked-client launcher for the game Minecraft"
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('557784556e8eae04db94e38dbafcd313c6870ada06b76868cfbe096d187cc37079fa70a088e1543529706f91ae77f0f2151a50d67ba39dbddaaadad21ff7d9cb')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
