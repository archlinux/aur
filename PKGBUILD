# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=php-codesniffer-wordpress
_pkgname=WordPress-Coding-Standards
pkgver=0.14.1
pkgrel=1
pkgdesc="PHP_CodeSniffer rules (sniffs) to enforce WordPress coding conventions "
arch=('any')
url="https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards"
license=('MIT')
depends=('php-codesniffer')
makedepends=()
source=("https://github.com/$_pkgname/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('6058eb85a3a55fd2ecbc47c0f6870c96d3137c8fa84a858eb8798835cf529597')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Core"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Core/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Docs"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Docs/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Extra"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Extra/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-VIP"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-VIP/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
