# Maintainer: Aner Andros <code@anerandros.info>

pkgname=freeter
pkgver=1.1.0
pkgrel=7
pkgdesc="The smartest way to work on your projects"
arch=('x86_64' 'i686')
url="https://freeter.io"
license=('custom')
depends=('glib2' 'fuse2')
optdepends=()
provides=('freeter')
conflicts=('freeter')
options=(!strip)

source=("https://freeter.io/download/Freeter.AppImage")

md5sums=('5c5b27a0ed9fcc94298c60d36d30601c')

noextract=("Freeter.AppImage")

package() {
	install -d "$pkgdir"/{opt/freeter,usr/bin}

	install -m755 Freeter.AppImage "${pkgdir}"/opt/freeter
	ln -sf /opt/freeter/Freeter.AppImage "${pkgdir}"/usr/bin/freeter
}
