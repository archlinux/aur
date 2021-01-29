# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=glooctl-bin
pkgver=1.6.6
pkgrel=1
pkgdesc="Provides useful functions to install, configure, and debug Gloo."
arch=(x86_64)
url="https://docs.solo.io/gloo/latest"
license=('apache')
provides=("glooctl-bin")
source=("glooctl-${pkgver}::https://github.com/solo-io/gloo/releases/download/v${pkgver}/glooctl-linux-amd64")
sha256sums=('b2b41c1be33dd41eab8ab795a3a7dd4c506b9f56d5351a3f3e3307571137cc48')

package() {
	install -Dm755 "glooctl-${pkgver}" "${pkgdir}/usr/bin/glooctl"
}
