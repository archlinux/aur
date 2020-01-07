# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=dockle-bin
_pkgname=dockle
pkgver=0.2.4
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start"
arch=(x86_64)
url="https://github.com/goodwithtech/dockle"
license=('AGPL')
makedepends=()
provides=('dockle')
conflicts=('dockle')
source=("https://github.com/goodwithtech/dockle/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("b0eca64539f2f768f95da9fab71074f28cea7b810d25e6af7fb507efe095db70")

package() {
	install -Dm755 "${srcdir}/dockle" "${pkgdir}/usr/bin/dockle"
}
