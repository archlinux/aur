# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibilitywp
_pkgname=PHPCompatibilityWP
pkgver=2.1.2
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) to analyse the codebase of a WordPress-based project for PHP cross-version compatibility."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibilityWP"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcompatibility' 'php-codesniffer-phpcompatibilityparagonie')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7a4421f726a21eb389a7e9c0921a5821a629f9468f1aa80dc5466d8786e8815b')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityWP"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityWP/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
