# Maintainer: Stephan Conrad <stephan@conrad.pics>
pkgname=spice-html5
pkgver=0.2.2
pkgrel=2
epoch=
pkgdesc="a html5 client for the spice protocol "
arch=('any')
url="https://gitlab.freedesktop.org/spice/spice-html5"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://gitlab.freedesktop.org/spice/spice-html5/-/archive/spice-html5-0.2.2/spice-html5-spice-html5-0.2.2.tar.gz')
noextract=()

package() {
	cd "spice-html5-spice-html5-0.2.2/"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('9f1d3feee10ed505fe2bcba88ab87d8e3a1366bfc01613f88e50e37b4c19b4df')
