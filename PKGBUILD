# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-ui-editors
pkgver=7.8.0
pkgrel=6
pkgdesc='Open-Xchange'
groups=('open-xchange')
install='open-xchange-documents-ui-editors.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-documents-backend' 'open-xchange-documents-ui-common')
makedepends=()
conflicts=()
provides=('open-xchange-documents-ui-editors')
source=('https://software.open-xchange.com/products/appsuite/stable/office-web/DebianJessie/all/open-xchange-documents-ui-editors_7.8.0-6_all.deb')
sha256sums=('d63d42e45164dd28ed9c093fee1980cfa9b513a42f472a1ae99bdbaabd6fbc41')

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
