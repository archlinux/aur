# Maintainer: Martin Mariano <contato@martinmariano.com>
# Contributor: Prepros <hi@prepros.io>

pkgname=prepros-bin
pkgver=6.2.3
pkgrel=1
pkgdesc="Compile Sass, Less, Jade and much more with live browser refresh."
arch=('x86_64')
url="https://prepros.io"
license=('custom:"Copyright (c) 2018 Prepros Ltd"')

depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libcap' 'libcups' 'libgcrypt' 'libnotify' 'libsystemd' 'libudev0' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango' 'xdg-utils' 'zlib')
optdepends=('libgnome-keyring'
            'lsb-release')
options=('!strip' '!emptydirs')

install=${pkgname}.install

source_x86_64=("https://prepros.io/downloads/stable/linux")
sha512sums_x86_64=('cfb8116b8ff4bf6d1e24ac1b570cff12e83d1433e40fd9255b639df5ac820812bd2a8e989285be3363bc846a6105b0a43ac1cf8d32d419ccf5f5ea70fd170305')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/prepros/resources/extensions/slim.asar.unpacked/ruby_gems/gems/temple-0.8.0/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/prepros/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
