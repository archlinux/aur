# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('455e2a6bd81bbdb821b57b9e219e9a58f9949cb59e7d4276792e48071dc1c443')

source_aarch64=("promptr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('cc17f2d4a9209c6951442dbe4e8fb09a02697968ae2f938436e7c359819838fe')

package() {
  bsdtar -xf "${srcdir}/promptr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
