# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsutils
_pkgname=PHPCSUtils
pkgver=1.2.0
pkgrel=1
pkgdesc="A set of utilities to aid developers of sniffs for PHP_CodeSniffer"
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSUtils"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('45e70481ef168d477ae092386b51c4a45e6562e86b4ccc4c07be49b9396fcf6a0f60636a23741bb364b4cfeb1145002e3dc6d9be01122e77f4094cec9dfa74b6')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCSUtils"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSUtils/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
