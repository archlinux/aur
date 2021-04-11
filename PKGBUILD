# Maintainer: Matt C <matt@xhec.us>
pkgname=devbook-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Search engine for developers"
arch=('x86_64')
url="https://usedevbook.com"
license=('custom:proprietary')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://dl.todesktop.com/2102273jsy18baz/linux/deb/x64")
sha512sums_x86_64=('f1e8376be6efc4377b6b011d008f76ba690e4561673ccdd51251067e2227eadf8281d88d3f792130c219b22e9030d7c3e932a1bbac02905ecadbfc630b446645')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
