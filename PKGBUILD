# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-messaging
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open Xchange backend messaging extension. Adds the feature to use messaging services to the backend installation.'
groups=()
install='open-xchange-messaging.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-oauth' 'open-xchange-xerces' 'open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-messaging')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-messaging_7.8.0-6_all.deb')
sha256sums=('d2abd5c098482f51b4a1b77a7d1555fecded6fd2ee68615fdb797ef3cb0b598a')

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
