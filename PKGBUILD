# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsutils
_pkgname=PHPCSUtils
pkgver=1.2.2
pkgrel=1
pkgdesc="A set of utilities to aid developers of sniffs for PHP_CodeSniffer"
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSUtils"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e614aef8ed0e4500b7173ef34ca724c267912a31644332a0d8e0955562083df12200ea3e01b316509f8da0140af7a94c63af892d78561568d70c8eaae715256b')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCSUtils"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSUtils/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
