# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>
pkgname=mysql-docs
pkgver=5.7
pkgrel=5
pkgdesc="Set of HTML documentation for MySQL."
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("http://downloads.mysql.com/docs/refman-${pkgver}-en.html-chapter.tar.gz")
sha256sums=('b76e315332c7b830e900b9aabac748b8b614d1b0388b1d366b1da9711958ae3b')

package() {
  install -d ${pkgdir}/usr/share/doc/mysql
  cp -a ${srcdir}/refman-${pkgver}-en.html-chapter/* \
   ${pkgdir}/usr/share/doc/mysql/
}
