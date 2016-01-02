# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-documents-ui
pkgver=7.8.0
pkgrel=6
pkgdesc='Meta package for all Open-Xchange Documents web applications'
groups=()
install='open-xchange-documents-ui.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-documents-ui-editors')
makedepends=()
conflicts=()
provides=('open-xchange-documents-ui')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-documents-ui_7.8.0-6_all.deb')
sha256sums=('e6065de395625ef1bdb708e30d6d64b791d1dcea4e25391af2152ae3e9e75a61')

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
