# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

_pkgname=shift-cli
pkgname=shift-cli-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
provides=('shift-cli')
conflicts=('shift-cli')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('12686b6ac8b1a44bd500a54e422ac5954d3acd3382a88e4c5bcbfe25d452a78f43f01401d801eacb9218681ae688f1f984b30179534874935bcfdba86c4e830c')

package() {
  install -D -m644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/cli-${pkgver}/builds/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
