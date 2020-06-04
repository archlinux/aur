# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=1.3.28
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("glooctl-${pkgver}::https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=('75a8561391f5cb05abb253c39d2fd7d749eda3750f7cd5a86a253a608d10e4bb')

package() {
	install -Dm755 "glooctl-${pkgver}" "${pkgdir}/usr/bin/glooctl"
}
