# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('3c166704df23d89c32da3d252402d8a35411391a45b15a698b769d61749eb732')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('47ecd555da2448b67f1c722c9f76f5982bc899ac0d45cc6a9c103c343da8f679')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
