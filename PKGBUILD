# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-imap
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange IMAP Bundle'
groups=('open-xchange-minimal')
install='open-xchange-imap.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-mailstore')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange-imap_7.8.0-6_all.deb')
sha256sums=('9c54241337c5b0ba0e48ae6d6d1bbb3cf5d8f9a56a102a7245b8d7ca08c24bef')

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
