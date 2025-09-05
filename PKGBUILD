# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsutils
_pkgname=PHPCSUtils
pkgver=1.1.2
pkgrel=1
pkgdesc="A set of utilities to aid developers of sniffs for PHP_CodeSniffer"
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSUtils"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('c3b40da1bcd4ba771374b957be4ef25df089066515aab3715ae2a283f9dee709438ccd37555de85392f9d08c899476e67400f61bef11d73752c20e786585a085')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCSUtils"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSUtils/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
