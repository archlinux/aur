# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=rke
pkgver=0.1.12
pkgrel=1
pkgdesc="An extremely simple, lightning fast Kubernetes installer that works everywhere."
arch=('x86_64')
url="https://github.com/rancher/rke"
license=('apache')
source=(
	"rke-${pkgver}::https://github.com/rancher/rke/releases/download/v${pkgver}/rke_linux-amd64"
)
noextract=(
	"rke-${pkgver}"
)
sha256sums=(
	"e5d730d37e7d98092f8576f5c56996a14e0ed6033ff8eec8d02484b061773199"
)
package() {
	install -D -m755 "rke-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
