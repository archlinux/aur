# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-realtime-json
pkgver=7.8.0
pkgrel=6
pkgdesc='Realtime channel implementation for frequent polling'
groups=()
install='open-xchange-realtime-json.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-realtime-core' 'open-xchange-grizzly')
makedepends=()
conflicts=()
provides=('open-xchange-realtime-json')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-realtime-json_7.8.0-6_all.deb')
sha256sums=('1fd742e2d137775d89f53ae9371a5f02227a67a674c9cd451a19fc19db70903d')

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
