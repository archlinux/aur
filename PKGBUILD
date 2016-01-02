# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-freebusy
pkgver=7.8.0
pkgrel=6
pkgdesc='Free/Busy module providing user- and resource-availability information'
groups=()
install='open-xchange-freebusy.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-freebusy')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-freebusy_7.8.0-6_all.deb')
sha256sums=('e42d9a206d8bade2f193720b4386a3ddcece0f3816056c6cc424fa16b01f21b9')

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
