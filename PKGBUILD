# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=rke
pkgver=0.1.14
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
	"e2d66d159c3405461616fdc81a8bc8bcf35b6dae94619d6b98cfdcb5d43143b3"
)
package() {
	install -D -m755 "rke-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
