# Maintainer: Evert Vorster <evorster at gmail dot com>
pkgname=pi-ext-observational-memory
pkgver=3.0.2
pkgrel=1
pkgdesc='Observational memory extension for pi coding agent — cache-friendly tiered compaction with observations and reflections'
arch=('any')
url='https://github.com/elpapi42/pi-observational-memory'
license=('MIT')
depends=('pi-coding-agent')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://registry.npmjs.org/pi-observational-memory/-/pi-observational-memory-${pkgver}.tgz"
)
sha256sums=('bc6a5fe90919562dece4c053570a029b4aff6d279a1a6b90d3c19bfd8264383c')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/observational-memory"
  cp -a "${srcdir}/package/." "${pkgdir}/usr/share/pi/extensions/observational-memory/"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
