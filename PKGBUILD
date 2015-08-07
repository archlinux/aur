# Maintainer: Chris <alostengineer at narmos dot org>
pkgname=roundcube_persistent_login
pkgver=4.2
pkgrel=1
pkgdesc="Provides a 'Keep me logged in' functionality for Roundcube"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rcmailifpl/"
license=('GPL')
depends=('roundcubemail')
source=(http://downloads.sourceforge.net/project/rcmailifpl/persistent_login-${pkgver}.zip)
install=$pkgname.install

package(){
	install -m 755 -d ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/composer.json
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/config.inc.php.dist
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/package.xml
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/persistent_login.css
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/persistent_login.js
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/persistent_login_larry.css
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login ${srcdir}/persistent_login/persistent_login.php
	install -m 755 -d ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login/localization
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login/localization ${srcdir}/persistent_login/localization/*.inc
	install -m 755 -d ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login/sql
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login/sql ${srcdir}/persistent_login/sql/mysql.sql
	install -m 644 -t ${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login/sql ${srcdir}/persistent_login/sql/postgres.sql
}

md5sums=('6bf2a23bfbc38377bd0b0e548c2f2dff')
