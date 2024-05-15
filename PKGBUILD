# Maintainer: David Biro <dbiro97@gmail.com>

pkgname=vonal-bin
pkgver="v1.5.0"
pkgrel=1
pkgdesc='Global search for tiling window managers'
arch=(x86_64)
url='https://github.com/fxdave/vonal-rust'
license=('GPLv3')
provides=(vonal)
options=('!strip')
source=("${url}/releases/download/${pkgver}/vonal.tar.gz")
b2sums=('99a3e6fd3336037ec843da40d72d8f95672afd8fff86964b41fb0fa856319ebb4f38ab1e0751c06253c4b4c9d237256a07285a3a40eb174b3bc61ddf19a444f6')

package() {
	install -D "${srcdir}/vonal" "${pkgdir}/usr/bin/vonal"
	install -D "${srcdir}/vonalc" "${pkgdir}/usr/bin/vonalc"
}
