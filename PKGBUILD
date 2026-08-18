# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')

source_x86_64=("mousr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('65c274f19a4d01eacf9c385af45da8363cc5846e7152b3d74caa07f6ae64c324')

source_aarch64=("mousr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('541da79f385ddc9069924944db6ff9fb125b7bdf7eb08a9bf1a09e3acb82326a')

package() {
  bsdtar -xf "${srcdir}/mousr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
