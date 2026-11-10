# Maintainer: Luís Fonseca <luispfonseca@gmail.com>
_pkgname=en-croissant

pkgname="${_pkgname}"-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="The Ultimate Chess Toolkit"
arch=('x86_64')
url="https://github.com/franciscoBSalgueiro/en-croissant"
license=('GPL-3.0')
conflicts=("en-croissant")
depends=('hicolor-icon-theme'
	pango
	webkit2gtk-4.1
	gtk3
	libsoup3
	glib2
	cairo
	gcc-libs
	gdk-pixbuf2
	glibc
	dbus
)

source_x86_64=("https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('671d99efd58f05742a572a01f057327b91cb963bbcf45a002ad2e0de05e7fa79')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
}
