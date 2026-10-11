# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.9.0
pkgrel=0
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('95c0ee5b5e5d401094ed58ac2f984ba5e935c2cb416c8752329fcfacb721aa9a')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
