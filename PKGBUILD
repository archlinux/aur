# Maintainer: Matt C <matt@xhec.us>
pkgname=devbook-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Search engine for developers"
arch=('x86_64')
url="https://usedevbook.com"
license=('custom:proprietary')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://dl.todesktop.com/2102273jsy18baz/builds/2103043hn88hvjv/linux/deb/x64")
sha512sums_x86_64=('66897862402032e53c41b0aadf8455539e1a685ae0e73d4af960f40e8b253e7043ef75cd4691fbde5023ba8bcb1c08dace156d19115fed12e209d750e1ad4e94')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
