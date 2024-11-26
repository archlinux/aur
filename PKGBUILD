# Maintainer: Talon <diablodev@googlegroups.com>
pkgname=astralrinth-bin
pkgver=0.8.9
pkgrel=1
pkgdesc="(none)"
arch=('x86_64')
url="https://github.com/DIDIRUS4/AstralRinth"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs' '!debug')
install=${pkgname}.install
source=("$url/releases/download/ARF-v${pkgver}/AstralRinth.App_${pkgver}_amd64.deb")
sha512sums=('fb5095d3b48532f662a4c481f234b0b338e04f8b829987d10aec4472e143194a9f6680fd374fe96c579d2583f673e29577e2c631828dd9a5f4d33480ca62bfcb')

package(){

        # Extract package data
        tar -xz -f data.tar.gz -C "${pkgdir}"

}
