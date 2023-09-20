# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

_pkgname=shift-cli
pkgname=shift-cli-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
provides=('shift-cli')
conflicts=('shift-cli')
depends=('php')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b0995c11a0216d47f733081ed7caab05249f438a0f87b124ff50e921f00a78ecb4844e624320137c13e09ae4921a39b25fc582c7321475c90552e365a0b11e6c')

package() {
  install -D -m644 "${srcdir}/cli-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/cli-${pkgver}/builds/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
