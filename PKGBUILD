# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato

pkgname=typstudio-bin
pkgver=0.1.0dev.20
_pkgver=${pkgver/dev/-dev}
pkgrel=1
pkgdesc='desktop application for typst'
url="https://github.com/Cubxity/${pkgname%-bin}"
arch=(x86_64)
license=(GPL3)
depends=(
	glibc
	hicolor-icon-theme
	gtk3
	glib2
	pango
	gdk-pixbuf2
	cairo
	gcc-libs
	libsoup
	webkit2gtk)
makedepends=()
source=("$pkgname-$pkgver.deb::https://github.com/Cubxity/typstudio/releases/download/v${_pkgver}/typstudio_0.1.0_amd64.deb")
sha256sums=('b9fad3eab676029c721a25b50abdcc7612896f39692318b5d3e4660c4b79fd12')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
