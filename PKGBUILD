# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=dockle-bin
_pkgname=dockle
pkgver=0.3.17
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start"
arch=(x86_64)
url="https://github.com/goodwithtech/dockle"
license=('AGPL')
makedepends=()
provides=('dockle')
conflicts=('dockle')
source=("https://github.com/goodwithtech/dockle/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('e45a89b6a657bca9d5a92d2d2233d70fbb2f73d5c58cf24b6f9058a249cbdad1')

package() {
	install -Dm755 "${srcdir}/dockle" "${pkgdir}/usr/bin/dockle"
}
