# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('c95eb22b88cbe1387199f520760a245d54e7281576699450edf483ac6eff4304')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('3c76e4b8b1f9e4544bb93c6492510dc9c76a6b7cebce4a8fed61cee39eaa4b96')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
