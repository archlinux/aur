# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-ui-common
pkgver=7.8.0
pkgrel=6
pkgdesc='Open-Xchange'
groups=('open-xchange')
install='open-xchange-documents-ui-common.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-appsuite-manifest')
makedepends=()
conflicts=()
provides=('open-xchange-documents-ui-common')
source=('https://software.open-xchange.com/products/appsuite/stable/office-web/DebianJessie/all/open-xchange-documents-ui-common_7.8.0-6_all.deb')
sha256sums=('3193a9ab84898097a0d5094daba358981894af5b2c235e4971ea53c5c3a8620d')

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
