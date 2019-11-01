# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=0.20.12
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("glooctl-${pkgver}::https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=('763643d41ecb1076d8ba6301701fc498cc6711357d29744aa28b11dc9c3ccdc1')

package() {
	install -Dm755 "glooctl-${pkgver}" "${pkgdir}/usr/bin/glooctl"
}
