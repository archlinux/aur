# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=arizen
pkgver=1.1.8
pkgrel=1
pkgdesc="Arizen is light API wallet for ZenCash with localy stored and encrypted files."
arch=('i686' 'x86_64')
url="https://github.com/ZencashOfficial/arizen"
license=('MIT')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcups' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'opera' 'pango')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/ZencashOfficial/arizen/releases/download/v1.1.8/Arizen_1.1.8_amd64.deb")
sha256sums=('3e816c70b95bbad0b4a907a6bc028371efa07c044e94c87c975fde51073dc3d3')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
