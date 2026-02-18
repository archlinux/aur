# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

_pkgname=shift-cli
pkgname=shift-cli-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
provides=('shift-cli')
conflicts=('shift-cli')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0c609beb2864abf49ebaa29f37a6dfefc2d499c4ac1a8ee1a8029064e307c6b851ba31a09dee9f25f19ecd4f9d3ff5bc2516087b248202be656a6bf483c20a48')

package() {
  install -D -m644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/cli-${pkgver}/builds/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
