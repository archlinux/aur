# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('4ec21c64c1432bfa36b5e84ff9dc3cb0ee4ac7ec454189afa21f98fa8705f39d')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('e40221756c148c4b44b094900ec6fa3351c3989263aa9accd568f09d1e78a4a3')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
