# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.1.3
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()
provides=("vylk=${pkgver}")
conflicts=(vylk)

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('91aea85a5b5f85156071e2588126f9abcb3cc82f0057b9624368494104614b81')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('c54e9af675aa9536022fc5d68bdb1dd986d717c31ce0f5953532585be7b9b476')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
