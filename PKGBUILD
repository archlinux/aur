# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=1.3.17
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("glooctl-${pkgver}::https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=('41b03fd95693a71bb4d4ff99109478d8940f97cac9c63e487d0b5586fbb5930f')

package() {
	install -Dm755 "glooctl-${pkgver}" "${pkgdir}/usr/bin/glooctl"
}
