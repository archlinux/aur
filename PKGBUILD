# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibilitywp
_pkgname=PHPCompatibilityWP
pkgver=2.1.7
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) to analyse the codebase of a WordPress-based project for PHP cross-version compatibility."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibilityWP"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcompatibility' 'php-codesniffer-phpcompatibilityparagonie')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9c355738c2e0253ab4f046c7d4a5d0288d3c57e4d6286090db0649428cebbdba53e3160067e7ba5b03809bbdd06a2467cb11f99b0f3ce680d7fe00d33e19ce5c')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityWP"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityWP/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
