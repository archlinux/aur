# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('81527455224dd8fb37b126c0eaa5614146ad4b7505a8f9bf93504ac317738b6a')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
