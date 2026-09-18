# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('9da27f6b15ae40f5ef103c3fe545b51195b08afac1b17a8fc3a43272b8d96826')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('cf49ba06784b21fcaca98792865bc2f5cf5b0c5958ef52217b09e3d5db27298c')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
