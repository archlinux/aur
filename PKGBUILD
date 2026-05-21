# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('f34aa3c5754c8c7ffe74a63f7d582011af8bc79a18211cbdca124593cef3516f')

source_aarch64=("promptr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('04248c7a85825ab47f0376dbc4101bb0b3e67fe61019f146df2c4373fcc3196f')

package() {
  bsdtar -xf "${srcdir}/promptr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
