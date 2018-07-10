# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=conduit
pkgver=0.5.0
pkgrel=1
pkgdesc="Next-generation ultralight service mesh for Kubernetes"
arch=('x86_64')
url="https://conduit.io/"
license=('Apache')
source=(
  "${pkgname}-${pkgver}::https://github.com/runconduit/conduit/releases/download/v${pkgver}/conduit-${pkgver}-linux"
)
sha256sums=('c3524a4a86ef3a3ba18e074fd9163341a244bce94d02d28e9d331c1c48e7145b')
install=conduit.install
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/conduit"
}

# vim:set ts=2 sw=2 et ai:
