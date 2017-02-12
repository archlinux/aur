# Maintainer: Aner Andros <code@anerandros.info>

pkgname=freeter
pkgver=0.13.0
pkgrel=4
pkgdesc="The smartest way to work on your projects"
arch=('x86_64' 'i686')
url="https://freeter.io"
license=('custom')
depends=()
optdepends=()
provides=('freeter')
conflicts=('freeter')
options=(!strip)

source=("https://freeter.io/download/Freeter.AppImage")

md5sums=('c1ab7e6568ce1f42ea3b4caf9efd25f2')

noextract=("Freeter.AppImage")

package() {
	install -d "$pkgdir"/{opt/freeter,usr/bin}

	install -m755 Freeter.AppImage "${pkgdir}"/opt/freeter
	ln -sf /opt/freeter/Freeter.AppImage "${pkgdir}"/usr/bin/freeter
}
