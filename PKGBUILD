# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=arizen
pkgver=1.2.0
pkgrel=1
pkgdesc="Arizen is light API wallet for ZenCash with localy stored and encrypted files."
arch=('i686' 'x86_64')
url="https://github.com/ZencashOfficial/arizen"
license=('MIT')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'opera' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/ZencashOfficial/arizen/releases/download/v1.2.0/Arizen_1.2.0_amd64.deb")
sha256sums=('1a60392a0a2d03bd457caa5672a0e771493c55f5f38569fc351b3afc088413db')

package() {

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
