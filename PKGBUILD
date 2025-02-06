# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('a8de5e3a02ebbe750be8b4ca71db74432c033c4506c732303246bf4d29ff6cfa')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
