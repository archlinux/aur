# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Native GTK4 chat frontend with independent provider plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell' 'curl' 'json-glib' 'libsecret')
provides=("promptr=${pkgver}")
conflicts=(promptr)

source_x86_64=("promptr-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('0a6e46c00ac2cddba59ed8d04ac24fb59482edf4d02efe0088d33059917e267a')

source_aarch64=("promptr-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/promptr_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('5b07deb3c4e0ffb2416c2db16d7e28ce058e5e4def388d086c38dc6a7d16926b')

package() {
  bsdtar -xf "${srcdir}/promptr-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
