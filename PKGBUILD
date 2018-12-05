# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=rke
pkgver=0.1.13
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
	"09717b40e464034ad34d78e722f9e8c1b9556cea3064c82b36305989eab9cf5b"
)
package() {
	install -D -m755 "rke-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
