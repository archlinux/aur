# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibilitywp
_pkgname=PHPCompatibilityWP
pkgver=2.1.8
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) to analyse the codebase of a WordPress-based project for PHP cross-version compatibility."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibilityWP"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcompatibility' 'php-codesniffer-phpcompatibilityparagonie')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('67895d6fe6e3e8061c30ba8449f50017fd561f45ad3b3e6ce20c58628ae70c3b10bd6b05f7b6ef12fd1ee34b6b23fbe6174e124728b2c4e8bf40a72d8e9af148')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityWP"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityWP/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
