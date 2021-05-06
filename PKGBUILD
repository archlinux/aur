# Maintainer: Matt C <matt@xhec.us>
pkgname=devbook-bin
pkgver=0.1.18
pkgrel=1
pkgdesc="Search engine for developers"
arch=('x86_64')
url="https://usedevbook.com"
license=('custom:proprietary')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://dl.todesktop.com/2102273jsy18baz/linux/deb/x64")
sha512sums_x86_64=('ace150143118976c207e088e8bfd0cfa1e48cc16499b66a583ad8a0d2199c4a361b37df498938cf4b670bba71529624cc198996fa26aae7c7a4d5174cf16268d')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
