# Maintainer: Luís Fonseca <luispfonseca@gmail.com>
_pkgname=en-croissant

pkgname="${_pkgname}"-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="The Ultimate Chess Toolkit"
arch=('x86_64')
url="https://github.com/franciscoBSalgueiro/en-croissant"
license=('GPL-3.0')
conflicts=("en-croissant")
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

source_x86_64=("https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('c55fbd6ade61e527125da584309f6c49052587daac337aad68a2bae0fbc9e33c')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
}
