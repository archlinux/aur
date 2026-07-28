# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsutils
_pkgname=PHPCSUtils
pkgver=1.2.3
pkgrel=1
pkgdesc="A set of utilities to aid developers of sniffs for PHP_CodeSniffer"
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSUtils"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('575b0fa8286f11b2a0aa4f09f6c183e80e203ba974eb685da34968d86dd8732bbb394224e6e09d1a4654bf3df53613745226e40967b86c111437a37166de6745')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCSUtils"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSUtils/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
