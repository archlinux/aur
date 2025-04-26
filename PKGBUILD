# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

# I keep forgetting the command to generate the .SRCINFO file, so I put it here as a reminder.
# makepkg --printsrcinfo > .SRCINFO

pkgname=liquidlauncher-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce, a popular utility mod, that features auto install and auto update."
arch=('x86_64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
sha512sums_x86_64=('b356b9ca5e34cc3166839845c5c015840a466cc6cca12d6dda2acc3ac07f122ed53991b549ef97346db99c04bff1890eaaad2096aebfd7fe77abe0db482635b0')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
}
