# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.8.8
pkgrel=0
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('453597b0254efbacb8c8ba60bd3796f143e749c67f85283defc20311a4ce944b')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
