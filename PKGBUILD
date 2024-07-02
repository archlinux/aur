# Maintainer: XSilverTH <XSilverTH AT proton DOT me>

pkgname=liquidlauncher-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft. A LiquidBounce hacked-client launcher for the game Minecraft"
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('546f02eae9ec14fe460ad471d504022c75f87522307894d3a2fe0e84169e1e19e695830fd2dd3aed1c02606b989e0cbe5cb925250d9a317eecae346f8ba7d05a')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
