# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-authentication-database
pkgver=7.8.0
pkgrel=6
pkgdesc='Module for authenticating users using the password stored in MySQL'
groups=('open-xchange-minimal')
install='open-xchange-authentication-database.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
provides=('open-xchange-authentication')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-authentication-database_7.8.0-6_all.deb')
sha256sums=('265ce2ebda1cb013e19e4e63d84b0de7d02028cc3f20f63dc3e09968cfd60e95')

package() {
    if test -f "data.tar.xz"; then
        tar xf data.tar.xz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
    
    if test -f "data.tar.gz"; then
        tar xf data.tar.gz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
}
