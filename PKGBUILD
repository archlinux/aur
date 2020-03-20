# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.6.0
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
  '221e1ed308694bd160fa909feddc5eb02c276e44491fca8d293a200190fb9f3896c0b13819d71260b57ef05085b9c38dfe769f4217947efcb949574e222f9167'
)

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/cloud-hypervisor
}
