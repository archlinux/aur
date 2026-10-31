# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()
provides=("vylk=${pkgver}")
conflicts=(vylk)

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('b9f6a0dba490d51f3f5846257470248fdc8356f749f3e3ec6da0f793b4c97a57')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('cb54ff7d98662d1a3eb7a999c794d5120e06df828d07b222efdff639d2d4f839')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
