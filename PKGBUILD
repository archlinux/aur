# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
)
sha512sums=(
  5e2f66efbff60e963c2b301aa9f632b16506bf7150616f1b9ecf641d1658089991e4b56e94b4b9f41821b1d09f90d3a870b6815279c4eb8fa9d5c518d2397501
  221e1ed308694bd160fa909feddc5eb02c276e44491fca8d293a200190fb9f3896c0b13819d71260b57ef05085b9c38dfe769f4217947efcb949574e222f9167
)

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/cloud-hypervisor
}
