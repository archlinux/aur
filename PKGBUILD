# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=dockle-bin
_pkgname=dockle
pkgver=0.1.15
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start"
arch=(x86_64)
url="https://github.com/goodwithtech/dockle"
license=('AGPL')
makedepends=()
provides=('dockle')
conflicts=('dockle')
source=("https://github.com/goodwithtech/dockle/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("99ccbe3b629945878e99c1e82f1a708c1cdec71335628f8d9472118f69c225ef")

package() {
	install -Dm755 "${srcdir}/dockle" "${pkgdir}/usr/bin/dockle"
}
