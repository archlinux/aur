# Maintainer: Martin Mariano <contato@martinmariano.com>
# Contributor: Prepros <hi@prepros.io>

pkgname=prepros-bin
pkgver=6.3
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
sha512sums_x86_64=('845ba9d117a18477b3e04529f57c25e8045ea793cba04f7f83d288bbe5866cd83594e8bd42391ad8df755ec68f742fd0e0e45ec65c2f53d8d85093ada6e7c473')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/prepros/resources/extensions/slim.asar.unpacked/ruby_gems/gems/temple-0.8.0/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/prepros/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
