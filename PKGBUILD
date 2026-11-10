# Maintainer: Luís Fonseca <luispfonseca@gmail.com>
_pkgname=en-croissant

pkgname="${_pkgname}"-bin
pkgver=0.16.1
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
sha256sums_x86_64=('8ce8e48dd69914c853bfebe9a1a5813bf0e34db85f03ef5c4dc060b396a07a61')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
}
