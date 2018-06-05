# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=conduit
pkgver=0.4.2
pkgrel=1
pkgdesc="Next-generation ultralight service mesh for Kubernetes"
arch=('x86_64')
url="https://conduit.io/"
license=('Apache')
source=(
  "${pkgname}-${pkgver}::https://github.com/runconduit/conduit/releases/download/v${pkgver}/conduit-${pkgver}-linux"
)
sha256sums=('7a05ec5a5551ed8340000695bbfb56592699ad6f0ef7dfef0a502576f10bff5d')
install=conduit.install
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/conduit"
}

# vim:set ts=2 sw=2 et ai:
