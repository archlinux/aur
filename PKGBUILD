# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('d2ccded0dd45e58efd7b2630c955f9745d35eadb05392868b6dcd758958297d5')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
