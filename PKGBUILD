# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-realtime-core
pkgver=7.8.0
pkgrel=6
pkgdesc='Open-Xchange'
groups=('open-xchange')
install='open-xchange-realtime-core.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-realtime-core')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-realtime-core_7.8.0-6_all.deb')
sha256sums=('6fdfa21d7fa4da227a932c7b4e3a1bee0517b4f1ba51d5d541f22084ed7daa8b')

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
