# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=typstudio-bin
pkgver=0.1.0dev.19
_pkgver=${pkgver/dev/-dev}
pkgrel=1
pkgdesc='desktop application for typst'
url="https://github.com/Cubxity/${pkgname%-bin}"
arch=(x86_64)
license=(GPL3)
depends=(
	glibc
	hicolor-icon-theme
	gtk3-no-tracker
	glib2
	pango
	gdk-pixbuf2
	cairo
	gcc-libs
	libsoup
	webkit2gtk)
makedepends=()
source=("https://github.com/Cubxity/typstudio/releases/download/v${_pkgver}/typstudio_0.1.0_amd64.deb")
sha256sums=('efb3ade4a07f7fd2b3b3c29b884ef7e54b652c5cb33b24e3cd73c0b819b33e03')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
