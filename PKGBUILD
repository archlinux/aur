# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange-drive
pkgver=7.8.0
pkgrel=6
pkgdesc='Server module for Open-Xchange Drive file synchronization'
groups=()
install='open-xchange-drive.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-core')
makedepends=()
conflicts=()
provides=('open-xchange-drive')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange-drive_7.8.0-6_all.deb')
sha256sums=('fc3b4c3dd8459b3e7f32dc3f4b88ccab9780c21b55de9a63db87fefff7a1c5bd')

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
