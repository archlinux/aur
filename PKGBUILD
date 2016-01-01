# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-authorization-standard
pkgver=7.8.0
pkgrel=6
pkgdesc='Module implementing the default authorization'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange-authorization-standard.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-authorization')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-authorization-standard_7.8.0-6_all.deb')
sha256sums=('1d74895ac9dcbae38844292e8aa532913addab1f97cb056d19bf6015eb1f627e')

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
