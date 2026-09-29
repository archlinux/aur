# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

# I keep forgetting the command to generate the .SRCINFO file, so I put it here as a reminder.
# makepkg --printsrcinfo > .SRCINFO

pkgname=liquidlauncher-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install & update and mod managment."
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('f097abe8b7678d7a7eab49ee2c74ee250b2d9383c93b15011864fee33ca890fd91a7f27b818cd7a752fd43afd69f08a0aa2855dccf592580bcb5425cc71f1804')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
