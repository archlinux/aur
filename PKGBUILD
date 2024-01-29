# Contributor: Asuka Minato
pkgname=cultivation-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A custom launcher designed to make it as easy as possible to proxy anime game traffic to private servers"
arch=(x86_64)
url="https://github.com/NotThorny/Cultivation"
license=('Apache2') # remaining fix SPDX
depends=(gcc-libs
	cairo
	dbus
	gtk3
	xz
	glibc
	glib2
	openssl
	hicolor-icon-theme
	webkit2gtk
	pango
	gdk-pixbuf2
)
provides=()
conflicts=()
source=("https://github.com/NotThorny/Cultivation/releases/download/$pkgver/cultivation_${pkgver}_amd64.deb"
)
sha256sums=('1668169b6aa4165a6bc2a573189a9a5e1bab2ebfd9d9bf43218bcb34f8e2b6c6')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
