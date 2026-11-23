# Maintainer: toxdes <hi@toxdes.com>
pkgname=mousr-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Keyboard-driven mouse control for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/mousr"
license=('MIT')
depends=('wayland' 'libxkbcommon')
provides=("mousr=${pkgver}")
conflicts=(mousr)

source_x86_64=("mousr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('ca8b72b1726637414119a96132a1e17272f9755753dca80b63edd9b96e64c7ff')

source_aarch64=("mousr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/mousr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('265a5dad06b879a31a6d59cdafaa38c38d8ccd38402cab22a8efa81dabbf1fc5')

package() {
  bsdtar -xf "${srcdir}/mousr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
