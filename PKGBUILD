# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-system
pkgver=7.8.0
pkgrel=6
pkgdesc='system integration specific infrastructure'
groups=('open-xchange-minimal')
install='open-xchange-system.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=()
makedepends=()
conflicts=()
provides=('open-xchange-system')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-system_7.8.0-6_all.deb')
sha256sums=('a347953370f8452fb436d591cf58ec634bcad0e10de0d3feeeaf076d08faeb0d')

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
