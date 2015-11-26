# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>

pkgname=mysql-docs
pkgver=5.7
pkgrel=1
pkgdesc="Set of HTML documentation for MySQL"
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("http://downloads.mysql.com/docs/refman-${pkgver}-en.html-chapter.tar.gz")
md5sums=('e3eba7716f6571d928eb2e68d26b4445')

package() {
  install -d ${pkgdir}/usr/share/doc/mysql
  cp -a ${srcdir}/refman-${pkgver}-en.html-chapter/* \
   ${pkgdir}/usr/share/doc/mysql/
}
