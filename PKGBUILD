# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=knative-client-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Knative developer experience, docs, reference Knative CLI implementation "
arch=(x86_64)
url="https://github.com/knative/client"
license=('apache')
provides=("kn")
source=("kn-${pkgver}::https://github.com/knative/client/releases/download/v${pkgver}/kn-linux-amd64")
sha256sums=('4dcc7afd657cf246b5fb6ccd18530a86d30607c024ecd9c4ef5be58e3822f339')

package() {
	install -Dm755 "kn-${pkgver}" "${pkgdir}/usr/bin/kn"
}
