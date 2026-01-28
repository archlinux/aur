# Maintainer: Christian Poveda <arch@pvdrz.com>
_pkgname=pawn-appetit

pkgname="${_pkgname}"-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Ultimate Chess Toolkit"
arch=('x86_64')
url="https://github.com/Pawn-Appetit/pawn-appetit"
license=('GPL-3.0')
conflicts=()
depends=('hicolor-icon-theme'
    openssl
	pango
 	webkit2gtk-4.1
	gtk3
	libsoup
	glib2
	cairo
	gcc-libs
	gdk-pixbuf2
	glibc
    gst-plugins-good
)

source_x86_64=("https://github.com/Pawn-Appetit/pawn-appetit/releases/download/v${pkgver}/Pawn.Appetit_${pkgver}_amd64.deb")
sha256sums_x86_64=('1ad6dd0217b931cd4f3359873a5dfa1fd1c8695769afe10fca86b4d01565e79a')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
}
