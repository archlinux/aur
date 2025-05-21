# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

# I keep forgetting the command to generate the .SRCINFO file, so I put it here as a reminder.
# makepkg --printsrcinfo > .SRCINFO

pkgname=liquidlauncher-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install and auto update."
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('1b8aa4eddc30c3139e88e20a400da6a0e137b3ce58bb436eafefe1e6f2317e2a59a0f6b31af6dccb78e258c7967c37863f1d408ff50143f02e062ecb10facb6c')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
