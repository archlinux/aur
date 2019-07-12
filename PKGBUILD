# Maintainer: Thorsten Schifferdecker <ts at systs dot org>
pkgname=ignite-bin
pkgver=0.4.1
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
sha256sums=('ac58339c4c265ef007f212ef6953070fafb7ff2beb12239711ea389e6c134cb1')

package() {
	install -D -m755 "ignite-${pkgver}" "${pkgdir}/usr/bin/ignite"
}
