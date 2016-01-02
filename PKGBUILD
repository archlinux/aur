# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-dav
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange CardDAV and CalDAV implementation'
groups=()
install='open-xchange-dav.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core' 'open-xchange-freebusy')
makedepends=()
conflicts=()
provides=('open-xchange-dav')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-dav_7.8.0-6_all.deb')
sha256sums=('30725e82c74e300d4314630fd6fe123da6455a16d352bfe6510667a13520dbe5')

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
