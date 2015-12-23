# Maintainer: Stephan Conrad <stephan@conrad.pics>
pkgname=spice-html5
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc="a html5 client for the spice protocol "
arch=('any')
url=""
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
source=('https://github.com/SPICE/spice-html5/archive/spice-html5-0.1.6.tar.gz')
noextract=()

package() {
	cd "spice-html5-spice-html5-0.1.6/"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('f3a349d878e851df047a03944f326d118fd490e9543f87cf4ce0c0d5601afcc7')
