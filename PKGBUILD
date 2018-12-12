# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>

pkgname=mysql-docs
pkgver=8.0
pkgrel=1
pkgdesc="Set of HTML documentation for MySQL."
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.mysql.com/docs/refman-${pkgver}-en.html-chapter.tar.gz")
sha256sums=('a7cae15df1726151f9cd14acd5dcc6b0f9713ccf5b4e69a223ea5b89e00e3612')

package() {
  install -d ${pkgdir}/usr/share/doc/mysql/html
  cp -a refman-${pkgver}-en.html-chapter/* \
   ${pkgdir}/usr/share/doc/mysql/html/
}
# vim:set ts=2 sw=2 et:
