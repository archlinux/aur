# Maintainer: Christian Poveda <arch@pvdrz.com>
_pkgname=pawn-appetit

pkgname="${_pkgname}"-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Ultimate Chess Toolkit"
arch=('x86_64')
url="https://github.com/Pawn-Appetit/pawn-appetit"
license=('GPL-3.0')
conflicts=()
depends=('hicolor-icon-theme' openssl-1.1
	pango
 	webkit2gtk-4.1
	gtk3
	libsoup
	glib2
	cairo
	gcc-libs
	gdk-pixbuf2
	glibc
)

source_x86_64=("https://github.com/Pawn-Appetit/pawn-appetit/releases/download/v${pkgver}/Pawn.Appetit_${pkgver}_amd64_linux.deb")
sha256sums_x86_64=('e82b8a7294ce67a6f5c5fdecf187486eb378e9e95ac2b17586a082e206ab090c')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
}
