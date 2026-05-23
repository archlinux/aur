# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('04d01af3db2d03b3625bce212d43574b2e464ca93fbc4e12f6d208e834da88ac')

source_aarch64=("promptr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('754aadada122edcb2ba1b1634745e583938151d28ec933d9fbc1e94ad52cf95a')

package() {
  bsdtar -xf "${srcdir}/promptr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
