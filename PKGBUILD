# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=rke
pkgver=0.2.6
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
	"7699e0fd3428c37c1683395c566931da0182317f5bde9084812dadc5dcae5619"
)
package() {
	install -D -m755 "rke-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
