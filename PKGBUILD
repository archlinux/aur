# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-backend
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange documents backend productivity extension'
groups=()
install='open-xchange-documents-backend.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-oauth' 'open-xchange-realtime-json' 'open-xchange-documentconverter-api' 'open-xchange-file-distribution' 'open-xchange-documents-templates' 'calcengine')
makedepends=()
conflicts=()
provides=('open-xchange-documents-backend')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-documents-backend_7.8.0-6_all.deb')
sha256sums=('5debabceea4397914b89469c5cda9a9abb368e75808cf24545dfba909db8ab18')

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
