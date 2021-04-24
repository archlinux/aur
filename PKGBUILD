# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=dockle-bin
_pkgname=dockle
pkgver=0.3.13
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start"
arch=(x86_64)
url="https://github.com/goodwithtech/dockle"
license=('AGPL')
makedepends=()
provides=('dockle')
conflicts=('dockle')
source=("https://github.com/goodwithtech/dockle/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('52595423f77325a833752ea910c6c1d4c9de54296c2f9eab93b3806488bd3d4a')

package() {
	install -Dm755 "${srcdir}/dockle" "${pkgdir}/usr/bin/dockle"
}
