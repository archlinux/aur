# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documentconverter-api
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange backend for the documentconverter API'
groups=()
install='open-xchange-documentconverter-api.install'
arch=('x86_64')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-documentconverter-api')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/amd64/open-xchange-documentconverter-api_7.8.0-6_amd64.deb')
sha256sums=('92557fa17ac90aa2ae1f90089d4272bb06dad2b957d37c5f9179e2a3cf32a7db')

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
