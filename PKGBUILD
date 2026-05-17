# Maintainer: Evert Vorster <evorster at gmail dot com>
pkgname=pi-ext-observational-memory
pkgver=2.4.3
pkgrel=1
pkgdesc='Observational memory extension for pi coding agent — cache-friendly tiered compaction with observations and reflections'
arch=('any')
url='https://github.com/elpapi42/pi-observational-memory'
license=('MIT')
depends=('pi-coding-agent')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://registry.npmjs.org/pi-observational-memory/-/pi-observational-memory-${pkgver}.tgz"
)
sha256sums=('60e4f4124fbd73fbaaa4e760199315c2809d7386e133c9a2b72703f7535ca047')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/observational-memory"
  cp -a "${srcdir}/package/." "${pkgdir}/usr/share/pi/extensions/observational-memory/"
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
