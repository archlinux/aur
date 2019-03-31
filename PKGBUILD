# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=rke
pkgver=0.2.1
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
	"716f66895cdd8c3b7f6b0db40413ee4333173e1a51c9f50dba17d8c4f1e606ca"
)
package() {
	install -D -m755 "rke-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
