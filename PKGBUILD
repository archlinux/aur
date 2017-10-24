# Maintainer: David Birks <david@tellus.space>
# Contributor: Aner Andros <code@anerandros.info>

pkgname=freeter
pkgver=1.2.1
pkgrel=2
pkgdesc="The smartest way to work on your projects"
arch=("x86_64" "i686")
url="https://freeter.io"
license=("custom")
depends=("glib2" "fuse2")
optdepends=()
provides=("freeter")
options=(!strip)

source=("https://freeter.io/download/Freeter.AppImage")

sha256sums=("7e10416460abdeb55f81d6ae0650476ae19c76f10a20ca895ea53c8d81d4ddb9")

noextract=("Freeter.AppImage")

package() {
	install -d "$pkgdir"/{opt/freeter,usr/bin}

	install -m755 Freeter.AppImage "${pkgdir}"/opt/freeter
	ln -sf /opt/freeter/Freeter.AppImage "${pkgdir}"/usr/bin/freeter
}
