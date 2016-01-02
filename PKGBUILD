# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-push-mailnotify
pkgver=7.8.0
pkgrel=6
pkgdesc='Open-Xchange Mail Push Bundle'
groups=()
install='open-xchange-push-mailnotify.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-push-mailnotify')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-push-mailnotify_7.8.0-6_all.deb')
sha256sums=('fb9d4069966d04a02e2aed23234cbcf073753cf06fefcf554b4cc0d7c2f3dcce')

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
