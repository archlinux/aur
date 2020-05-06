# Maintainer: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>

pkgname=prepros-bin
pkgver=7.2.21
pkgrel=1
pkgdesc="Compile Sass, Less, Jade and much more with live browser refresh."
arch=('x86_64')
url="https://prepros.io"
license=('custom:"Copyright (c) 2020 Prepros Ltd"')

depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'desktop-file-utils' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libcap' 'libcups' 'libgcrypt' 'libnotify' 'libsystemd' 'libudev0' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango' 'xdg-utils' 'zlib')
optdepends=('libgnome-keyring'
            'lsb-release')
options=('!strip' '!emptydirs')

install=${pkgname}.install

source_x86_64=("https://downloads.prepros.io/v7/Prepros-7.2.21.deb")
sha512sums_x86_64=('eb9c4be34bdbf075dfeab6a37ac0baae25f2cfcdeb003eaf1e01d29dd9ed3427dbd67650cf2dede6837682b15d015159c086237c748120eda421996f52860cbe')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

        install -D -m644 "${pkgdir}/usr/share/doc/prepros/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
