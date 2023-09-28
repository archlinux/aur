# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

_pkgname=shift-cli
pkgname=shift-cli-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
provides=('shift-cli')
conflicts=('shift-cli')
depends=('php')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('35b2db91bbbd5cfe2b8b6e53944864d9ea4e943f5801385c2fb3b199d19bb79ce8fb1e6fc8cad08ce91f58ffbd189cee2be3d85f6d95797bbbadb5897446608b')

package() {
  install -D -m644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/cli-${pkgver}/builds/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
