# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=conduit
pkgver=0.3.0
pkgrel=1
pkgdesc="Next-generation ultralight service mesh for Kubernetes"
arch=('x86_64')
url="https://conduit.io/"
license=('Apache')
source=(
  "${pkgname}-${pkgver}::https://github.com/runconduit/conduit/releases/download/v${pkgver}/conduit-${pkgver}-linux"
)
sha256sums=('f9e6baf9dcbf8883701d3235eb8a23ccca3a6beaec6a6104397c66dc4422e183')
install=conduit.install
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/conduit"
}

# vim:set ts=2 sw=2 et ai:
