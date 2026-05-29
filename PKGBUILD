# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.8.9
pkgrel=0
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('3011c5629c9138d2050fb23c510e09ae53e30ec52e6a9ab85632bc1550e8ef63')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
