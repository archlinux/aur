# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-grizzly
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange HTTP Server and Servlet Container'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange-grizzly.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-grizzly')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-grizzly_7.8.0-6_all.deb')
sha256sums=('575cb322735d658023e9851b755470b34739b559f427df8c8e0ef0816fc5fc28')

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
