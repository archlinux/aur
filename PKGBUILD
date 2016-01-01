# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-core
pkgver=7.8.0
pkgrel=6
pkgdesc='The essential core of an Open-Xchange backend'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange-core.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-osgi' 'open-xchange-xerces' 'open-xchange-system')
makedepends=()
conflicts=()
provides=('open-xchange-core')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-core_7.8.0-6_all.deb')
sha256sums=('bffd78d649a169f5c9bfb2c734f5c508b959a899ab3012f7e2952c9eabea81d3')

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
