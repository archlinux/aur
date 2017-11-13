# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>
pkgname=mysql-docs
pkgver=5.7
pkgrel=6
pkgdesc="Set of HTML documentation for MySQL."
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("http://downloads.mysql.com/docs/refman-${pkgver}-en.html-chapter.tar.gz")
sha256sums=('1c3452523d2565f328741afa8dc91fc5432d65a94cd5a1b584eb1e05ba05d5a0')

package() {
  install -d ${pkgdir}/usr/share/doc/mysql
  cp -a ${srcdir}/refman-${pkgver}-en.html-chapter/* \
   ${pkgdir}/usr/share/doc/mysql/
}
