# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-ui-static
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange Documents UI'
groups=()
install='open-xchange-documents-ui-static.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-appsuite')
makedepends=()
conflicts=()
provides=('open-xchange-documents-ui-static')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-documents-ui-static_7.8.0-6_all.deb')
sha256sums=('d1e8355675043f2a3bb32467f820b96e7ad861941ed2fb03dfde9253e10a5389')

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
