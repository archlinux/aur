# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Weaveworks Ignite, combines Firecracker MicroVMs with Docker/OCI images to unify containers and VMs."
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
sha256sums=('2d5dd6e54a30147481991b2c6e614fe31a58da98cfd2e04ddd0c4123a4dec987')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/ignite"
}
