# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-xerces-sun
pkgver=7.8.0
pkgrel=6
pkgdesc='Xerces Compat for Sun Java'
groups=('open-xchange-minimal')
install='open-xchange-xerces-sun.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-osgi')
makedepends=()
conflicts=()
provides=('open-xchange-xerces')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-xerces-sun_7.8.0-6_all.deb')
sha256sums=('859b509df02a1000ed5a5ac148f8c830efcbd6825d06182f2ffeaa1d01a7dff2')

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
