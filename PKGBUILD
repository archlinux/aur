# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Peter A. Shevtsov <pshevtsov@severusweb.ru>

pkgname=mysql-docs
pkgver=8.0
pkgrel=4
pkgdesc="Set of HTML documentation for MySQL."
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.mysql.com/docs/refman-${pkgver}-en.html-chapter.tar.gz")
sha256sums=('4a8817d54231c503a60d0ca72d9dfbc9cad131d906ece2892b4e7d136f16bd7d')

package() {
	install -d ${pkgdir}/usr/share/doc/mysql/html
	cp -a refman-${pkgver}-en.html-chapter/* \
		${pkgdir}/usr/share/doc/mysql/html/
}
# vim:set ts=4 sw=4:
