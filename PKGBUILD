# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

_pkgname=shift-cli
pkgname=shift-cli-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
provides=('shift-cli')
conflicts=('shift-cli')
depends=('php')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f8277b3d3b34482fb346c768678e293eeeb976209e37b478f3e79767c5e92b0b3b0c55630a86b8ee6ed98cae13e01a696ad8f327ebd49af81377b951099ce429')

package() {
  install -D -m644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/cli-${pkgver}/builds/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
