# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=1.2.12
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("glooctl-${pkgver}::https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=('77823fef9bd5002c15523b0b4324e6634f62988b46396f875309436a9af9c828')

package() {
	install -Dm755 "glooctl-${pkgver}" "${pkgdir}/usr/bin/glooctl"
}
