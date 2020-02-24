# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
)
sha512sums=(
  '31556c7928bb92317ca8492eeb6e38ba78aeb7ca340266943e6100ee39548b3ec1d8483035cb1935ae396d4708e692d967c5a88f227dea724b4049d9b9842456'
)

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/cloud-hypervisor
}
