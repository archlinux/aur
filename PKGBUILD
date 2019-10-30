# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=0.20.11
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=("c82196345b79a99f5508a32dd8b8c6569e6e1d104e9b261ae409afa685136e16")

package() {
	install -Dm755 "glooctl-linux-amd64" "${pkgdir}/usr/bin/glooctl"
}
