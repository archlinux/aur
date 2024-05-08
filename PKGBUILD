# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsutils
_pkgname=PHPCSUtils
pkgver=1.0.11
pkgrel=1
pkgdesc="A set of utilities to aid developers of sniffs for PHP_CodeSniffer"
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSUtils"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1bffed7470f53ea9f6fe73808b659695a28f2713dd317dec976728052cfdeccc12f3aa0aeb873f96aaa26d1ff71cd49957311837440f41acf037a1b6e9147adf')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCSUtils"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSUtils/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:

