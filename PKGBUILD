# Contributor: Asuka Minato
pkgname=rustytube-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A rusty Youtube client"
arch=(x86_64)
url="https://github.com/opensourcecheemsburgers/RustyTube"
license=('AGPL3') # I am not sure
depends=(webkit2gtk
	gcc-libs
	libsoup
	gdk-pixbuf2
	glib2
	glibc
	hicolor-icon-theme
	cairo
	gtk3
)
provides=(rustytube)
conflicts=(rustytube)
source=("https://github.com/opensourcecheemsburgers/RustyTube/releases/download/${pkgver}-alpha/RustyTube_${pkgver}_amd64.deb")
sha256sums=('5d13e94802d73732dd71f96e556c28a09ce34bd6fa0c446a579c5052e38583dd')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chmod -R 755 $pkgdir/usr
}
