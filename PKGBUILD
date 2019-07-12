# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Weave Ignite, combines Firecracker MicroVMs with Docker/OCI images to unify containers and VMs."
arch=('x86_64')
url="https://github.com/weaveworks/ignite"
license=('apache')
provides=('ignite')
source=(
	"ignite-${pkgver}::https://github.com/weaveworks/ignite/releases/download/v${pkgver}/ignite"
)
noextract=(
	"ignite-${pkgver}"
)
sha256sums=('5b1a66973f9f75b183d0de58b97b87b1289bbe786f43cd58083d9f5a8631044d')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
