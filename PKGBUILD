# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=conduit
pkgver=0.4.0
pkgrel=1
pkgdesc="Next-generation ultralight service mesh for Kubernetes"
arch=('x86_64')
url="https://conduit.io/"
license=('Apache')
source=(
  "${pkgname}-${pkgver}::https://github.com/runconduit/conduit/releases/download/v${pkgver}/conduit-${pkgver}-linux"
)
sha256sums=('9fb77b385f5d104ff01fb3d95c8b40218fd02da4c3d4002d1ddc104e783b653e')
install=conduit.install
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/conduit"
}

# vim:set ts=2 sw=2 et ai:
