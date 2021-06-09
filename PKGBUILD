# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=dockle-bin
_pkgname=dockle
pkgver=0.3.14
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start"
arch=(x86_64)
url="https://github.com/goodwithtech/dockle"
license=('AGPL')
makedepends=()
provides=('dockle')
conflicts=('dockle')
source=("https://github.com/goodwithtech/dockle/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('3168902bcfa49444fdeab916a8bb44cc92fdeaa7c1f0fc71a120328639ec565d')

package() {
	install -Dm755 "${srcdir}/dockle" "${pkgdir}/usr/bin/dockle"
}
