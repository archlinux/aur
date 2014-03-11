# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ldapauthmanager
pkgver=1.4.0
pkgrel=1
url=https://projects.jethrocarr.com/p/oss-ldapauthmanager/
pkgdesc="An LDAP user manager and password self-service webaapp."
arch=('any')
license=('AGPL')
#depends=('php' 'php-mcrypt' 'php-gd' 'php-ldap' 'php-suhosin' 'smtp-forwarder' 'mailx')
depends=('php-ldap')
#makedepends=('python-sphinx' 'icoutils' 'python-docutils' 'imagemagick')
# libmagickcore-extra
source=("https://projects.jethrocarr.com/p/oss-ldapauthmanager/downloads/get/ldapauthmanager-1.4.0.tar.bz2")
md5sums=('4b41c3c9deaf2750e3ffcaaf9a0c6c22')

#backup=('etc/webapps/ldapauthmanager/xyz')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    find
}

install () {
    echo "## You will need to create a database ##"
    echo "$ mysql ­-u root ­-p < sql/version_LATESTDATE_install.sql"
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
}
