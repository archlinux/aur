# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

pkgname=liquidlauncher-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft. A LiquidBounce hacked-client launcher for the game Minecraft"
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('34731d6782ce5e39d1e2d8139f9ddd6e42171b70fa517d1b83d0775c413d012dcd04ec45d1d49fc37adf3c053da3e298a13fd2c4848f85b9c3907040f8d04be6')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
