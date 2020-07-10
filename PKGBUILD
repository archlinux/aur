# Maintainer: Thomas Höß <hi@thomsn.de>
# Contributor: Prepros <hi@prepros.io>

pkgname=prepros-bin
pkgver=7.3.12
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

source_x86_64=("https://downloads.prepros.io/v7/Prepros-7.3.12.deb")
sha512sums_x86_64=('7f18a29ec20262eb24d16cf2f548495f93747d406a16efd7ef713f453c8a531c9d30eeda01aeaae8a6232a556aee8dc4b81d0ffee5cb0e397f96c749b15177da')

package(){

        # Extract package data
        tar xf data.tar.xz -C "${pkgdir}"

        install -D -m644 "${pkgdir}/usr/share/doc/prepros/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
