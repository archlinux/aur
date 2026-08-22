# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

# I keep forgetting the command to generate the .SRCINFO file, so I put it here as a reminder.
# makepkg --printsrcinfo > .SRCINFO

pkgname=liquidlauncher-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install & update and mod managment."
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('784689aca44b303af1806598a72104861c451290a0f10fd9aa64c6e640cf4dcf86af88418db22d5eca8360a897942d568a03608a87c090ce5924dd588a6866ac')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
