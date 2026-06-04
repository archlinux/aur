# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('90a49ac8a61e492e9d7208e09b70143a18debeb2dc0bce74c196bb9f0fab9c3c')

source_aarch64=("promptr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('d0002260ea79277681329c19e2ec4179ae63467f1859e56b73d1634d3c24e605')

package() {
  bsdtar -xf "${srcdir}/promptr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
