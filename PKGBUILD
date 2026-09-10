# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')

source_x86_64=("mousr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('d08cf477895675abd71c2c176d31d2b7dc175bb133ab9fd3bd8e73b7e6f9759f')

source_aarch64=("mousr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('14d2d0810a0821e656879104731509140fc5158513c2249859cf757b093f8d7b')

package() {
  bsdtar -xf "${srcdir}/mousr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
