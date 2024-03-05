# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('a0532048e2310c1f4b3c438a502fee651b5c3dc4360ff66a29204047145b3d63')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
