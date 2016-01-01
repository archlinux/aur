# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=calcengine
pkgver=1.4.993
pkgrel=1
pkgdesc='OX Appsuite  CalcEngine'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='calcengine.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=()
makedepends=()
conflicts=()
provides=('calcengine')
source=('https://software.open-xchange.com/products/appsuite/stable/calcengine/DebianJessie/all/calcengine-1.4.993-Linux.deb')
sha256sums=('406389fe920b6f8039aa2b98d10eaf4e30773d98f34ac509b3546aac3fc5ca16')

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
