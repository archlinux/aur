# Maintainer: toxdes <hi@toxdes.com>
pkgname=vylk-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Lightweight, low-resource single-binary markdown notes editor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/vylk"
license=('MIT')
depends=()

source_x86_64=("vylk-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('420d4c0b60b3f3af53fd6c4695d1d6f42531b95608bd5b334d39115afc5335ed')

source_aarch64=("vylk-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/vylk_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('91c5e90dbf12d2891a83e29b4ac5c5e6c96bcb8fc5e919f12b7a8b2439d15a0c')

package() {
  bsdtar -xf "${srcdir}/vylk-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
