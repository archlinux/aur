# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-admin
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange backend administration extension'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange-admin.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-admin')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-admin_7.8.0-6_all.deb')
sha256sums=('adf8844f67e7e0970a37bd34ff06eab65fa796868a4c9dbaa3a115513bfb5d7d')

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
