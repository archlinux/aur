# Maintainer: Aner Andros <code@anerandros.info>

pkgname=freeter
pkgver=1.0.0
pkgrel=5
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

md5sums=('6fae81a1e182886b3a5a3b51ce8e6a63')

noextract=("Freeter.AppImage")

package() {
	install -d "$pkgdir"/{opt/freeter,usr/bin}

	install -m755 Freeter.AppImage "${pkgdir}"/opt/freeter
	ln -sf /opt/freeter/Freeter.AppImage "${pkgdir}"/usr/bin/freeter
}
