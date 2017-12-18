# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=conduit
pkgver=0.1.0
pkgrel=1
pkgdesc="Next-generation ultralight service mesh for Kubernetes"
arch=('x86_64')
url="https://conduit.io/"
license=('Apache')
source=(
  "${pkgname}-${pkgver}::https://github.com/runconduit/conduit/releases/download/v${pkgver}/conduit-${pkgver}-linux"
)
sha256sums=('c8bf2faf0853d2ba12d8774bf645512c956f45000bb8c8daba00cfed38637015')
install=conduit.install
options=(!strip)

package() {
  install -Dm755 ../${pkgname}-${pkgver} "${pkgdir}/usr/bin/conduit"
}

# vim:set ts=2 sw=2 et ai:
