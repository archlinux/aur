# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

pkgname=liquidlauncher-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A LiquidBounce launcher for Minecraft. A LiquidBounce hacked-client launcher for the game Minecraft"
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('f91f36a7c208d73c579c8b02587521641952da35aadaba8dea425d635bae43c86d2c55b560d3d146fd197b5a9e5c3058af90780b5709481d0cbf3e33c341e81f')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
