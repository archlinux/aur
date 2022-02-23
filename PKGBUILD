# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=knative-client-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Knative developer experience, docs, reference Knative CLI implementation "
arch=(x86_64)
url="https://github.com/knative/client"
license=('apache')
provides=("kn")
source=("kn-${pkgver}::https://github.com/knative/client/releases/download/knative-v${pkgver}/kn-linux-amd64")
sha256sums=('3aba2d0bd9b3ce6133166148d1ec40f9cdc24c28f8899d1f838f8397af62cbd0')

package() {
	install -Dm755 "kn-${pkgver}" "${pkgdir}/usr/bin/kn"
}
