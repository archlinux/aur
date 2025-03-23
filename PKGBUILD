# Maintainer: erdii <me@erdii.engineering
pkgname=gvproxy-bin
pkgver=0.8.5
pkgrel=0
pkgdesc="A new network stack based on gVisor - gvproxy"
url="https://github.com/containers/gvisor-tap-vsock/"
license=('Apache')
arch=('x86_64')
source=("gvproxy-${pkgver}::https://github.com/containers/gvisor-tap-vsock/releases/download/v${pkgver}/gvproxy-linux-amd64")
sha256sums=('49e4a677b2935c2232d1d17af816e4435a414f488ef400438f0c4688550fa724')

package() {
  install -Dm755 "${srcdir}/gvproxy-${pkgver}" "${pkgdir}/usr/bin/gvproxy"
}
